#!/usr/bin/python
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import actionlib
import sys
import tf
import math
import edufill_srvs.srv
import std_srvs.srv
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *

# Move arm to a cartesian position
def to_pose(pose):
    x = pose[0]
    y = pose[1]
    yaw = pose[2] 
    try: 
        # convert to pose message

        pose.header.stamp = rospy.Time.now()
        pose.header.frame_id = "/map"
        pose.pose.position.x = x
        pose.pose.position.y = y
        pose.pose.position.z = 0.0
        q = tf.transformations.quaternion_from_euler(0, 0, yaw)
        pose.pose.orientation.x = q[0]
        pose.pose.orientation.y = q[1]
        pose.pose.orientation.z = q[2]
        pose.pose.orientation.w = q[3]

        action_server_name = "/move_base"
        client = actionlib.SimpleActionClient(action_server_name, MoveBaseAction)
        client_goal = MoveBaseGoal()
        client_goal.target_pose = pose 
        client.wait_for_server()
        # send goal
        client.send_goal(client_goal)
        client.wait_for_result()
        return 'succeeded'

    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s",self.action_server_name, e)  
        return 'srv_call_failed'

def to_goal(goal):

    if (not rospy.has_param("script_server/base/" + goal)):
        rospy.logerr("location <<" + goal + ">> is not on the parameter server")
        return 'location_not_known'
    
    pose = rospy.get_param("script_server/base/" + goal)
   
    result = to_pose(pose)  
  
    return result    

def relative(goal_behaviour):
    x_distance = goal_behaviour[0]
    y_distance = goal_behaviour[1]
    angular_displacement = goal_behaviour[2]
    move_base_relative_srv_name = '/edufill_relative_movements/move_base_relative'
    move_base_relative_srv = rospy.ServiceProxy(move_base_relative_srv_name,edufill_srvs.srv.SetPoseStamped) 
    try:            
        rospy.loginfo("wait for service: <<%s>>", move_base_relative_srv_name)   
        rospy.wait_for_service(move_base_relative_srv_name, 15)
        goalpose = geometry_msgs.msg.PoseStamped()
        goalpose.pose.position.x = x_distance             
        goalpose.pose.position.y = y_distance
        goalpose.pose.position.z = 0.05 # speed
        quat = tf.transformations.quaternion_from_euler(0,0,angular_displacement)
        goalpose.pose.orientation.x = quat[0]
        goalpose.pose.orientation.y = quat[1]
        goalpose.pose.orientation.z = quat[2]
        goalpose.pose.orientation.w = quat[3]
        print goalpose        
        move_base_relative_srv(goalpose)
        return 'succeeded'
    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s",move_base_relative_srv_name, e)  
        return 'srv_call_failed'

def command(motion_direction,time):
    base_velocity = 0.1
    pub = rospy.Publisher("/cmd_vel",Twist)
    youbot_base_velocity = Twist()
    zero_vel = Twist()
    youbot_base_velocity = zero_vel
    if(motion_direction == "forward"):
        youbot_base_velocity.linear.x = base_velocity
    elif(motion_direction == "backward"):
        youbot_base_velocity.linear.x = -base_velocity
    elif(motion_direction == "right"):
        youbot_base_velocity.linear.y = -base_velocity
    elif(motion_direction == "left"):
        youbot_base_velocity.linear.y = base_velocity
    elif(motion_direction == "rotate_anticlockwise"):
        youbot_base_velocity.angular.z = base_velocity
    elif(motion_direction == "rotate_clockwise"):
        youbot_base_velocity.angular.z = -base_velocity
    elif(motion_direction == "stop"):
        youbot_base_velocity = zero_vel
    else:
        return 'failure'  
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        #print time_taken
        pub.publish(youbot_base_velocity)
        #rospy.sleep(0.1)
    #timer.shutdown()
    print 'latest time recorded is ' + repr(now) +' secs'
    print 'base command successfully published for '+ repr(time_taken) +' secs'
    return 'success'

def my_callback(event):
    print 'Timer called at '+str(event.current_real)
 

if __name__ == '__main__':
    rospy.init_node('movebase')
    motion_direction = 'rotate_clockwise'
    time = 5.0
    result = command(motion_direction,time)
    



