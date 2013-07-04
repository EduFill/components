#!/usr/bin/env python

import rospy
import roslib; roslib.load_manifest('edufill_arm_cmds') 
import math
import brics_actuator
from sensor_msgs.msg import JointState
from brics_actuator.msg import JointVelocities, JointPositions, JointValue, Poison 

def publish_to_youbot(jointState):
    pub = rospy.Publisher('arm_1/arm_controller/position_command', JointPositions)
    rospy.sleep(0.5) 
    try:
        jp = JointPositions()
        
        jv1 = JointValue()
        jv1.joint_uri = "arm_joint_1"
        jv1.value = jointState.position[0]
        jv1.unit = "rad"
        
        jv2 = JointValue()
        jv2.joint_uri = "arm_joint_2"
        jv2.value = jointState.position[1]
        jv2.unit = "rad"

        jv3 = JointValue()
        jv3.joint_uri = "arm_joint_3"
        jv3.value = jointState.position[2]
        jv3.unit = "rad"
        
        jv4 = JointValue()
        jv4.joint_uri = "arm_joint_4"
        jv4.value = jointState.position[3]
        jv4.unit = "rad"
        
        jv5 = JointValue()
        jv5.joint_uri = "arm_joint_5"
        jv5.value = jointState.position[4]
        jv5.unit = "rad"
        
        p = Poison()
        #print p
       
        jp.poisonStamp = p
        
        jp.positions = [jv1, jv2, jv3, jv4, jv5]
        
        pub.publish(jp)

        return 'arm moved successfully'

    except Exception, e:
        print e
        return 'arm move failure'

def publish_to_nxt(jointState):
  pub = rospy.Publisher('position_controller', JointState)
  rospy.sleep(0.5) 
  try:
    # Create msg
    jp = JointState()
    jp = jointState
    # Fill message

    r = rospy.Rate(500)
    for c in range(1,5):
      pub.publish(jp)
      r.sleep()

    return 'arm command move issued successfully'
  except Exception, e:
    print e
    return 'arm move failure'

def handler_callback(data):
	robot = os.getenv(ROBOT)
	if robot is "youbot-edufill2":
		publish_to_youbot(data)
	else:
	  publish_to_nxt(data)

def handler():
	rospy.init_node('arm_controller_handler', anonymous=True)
	rospy.Subscriber("arm_controller_handler/position_command", JointState, handler_callback)
	rospy.spin()

if __name__ == '__main__':
  handler()
    
