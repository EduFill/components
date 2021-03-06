#!/usr/bin/env python
#******************************************************************************
# Copyright (c) 2013
# All rights reserved.
#
# Edufill project 
# Hochschule Bonn-Rhein-Sieg
# University of Applied Sciences
# Computer Science Department
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Author:
# Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
# 
# Supervised by:
# Rhama Dwiputra, Bjoern Kahl
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# This software is published under a dual-license: GNU Lesser General Public
# License LGPL 2.1 and BSD license. The dual-license implies that users of this
# code may choose which terms they prefer.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of Locomotec nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License LGPL as
# published by the Free Software Foundation, either version 2.1 of the
# License, or (at your option) any later version or the BSD license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License LGPL and the BSD license for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License LGPL and BSD license along with this program.
#
#******************************************************************************
import roslib; roslib.load_manifest('edufill_base_cmds')
import rospy
import brics_actuator.msg
import sys
import tf
import actionlib
import math
import edufill_srvs.srv
import std_srvs.srv
# msg imports
from geometry_msgs.msg import *
from move_base_msgs.msg import *



def twist(base_velocity):
    # base_velocity = [lx,ly,lz,ax,ay,az]
    pub = rospy.Publisher("/cmd_vel",Twist)
    youbot_base_velocity = Twist()
    youbot_base_velocity.linear.x = base_velocity[0]
    youbot_base_velocity.linear.y = base_velocity[1]
    youbot_base_velocity.linear.z = base_velocity[2]
    youbot_base_velocity.angular.x = 0
    youbot_base_velocity.angular.y = 0
    youbot_base_velocity.angular.z = base_velocity[5]
    pub.publish(youbot_base_velocity)


# Move arm to a cartesian position
def to_pose(pose):
    x = pose[0]
    y = pose[1]
    yaw = pose[5] 
    try: 

        # convert to pose message
        pose = PoseStamped()
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
        return 'success'

    except Exception, e:
        rospy.logerr("service call <<%s>> failed: %s", action_server_name, e)  
        return 'srv_call_failed'

def to_goal(goal):

    if (not rospy.has_param("script_server/base/" + goal)):
        rospy.logerr("location <<" + goal + ">> is not on the parameter server")
        return 'location_not_known'
    
    pose = rospy.get_param("script_server/base/" + goal)   
    result = to_pose(pose)  
  
    return result    

def relative(goal):
    pose = Pose2D()
    pose.x = goal[0]
    pose.y = goal[1]
    pose.theta = goal[5]
    rospy.wait_for_service('/move_to_relative_pos')
    try:
        relative_motion= rospy.ServiceProxy('/move_to_relative_pos', edufill_srvs.srv.MoveToRelativePos)
        resp = relative_motion(pose)
        return resp.result
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

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
    youbot_base_velocity = Twist()
    pub.publish(youbot_base_velocity)
    print 'latest time recorded is ' + repr(now) +' secs'
    print 'base command successfully published for '+ repr(time_taken) +' secs'
    return 'success'

def my_callback(event):
    print 'Timer called at '+str(event.current_real)
 

if __name__ == '__main__':
    rospy.init_node('movebase')
    # motion_direction = 'rotate_clockwise'
    # time = 5.0
    # time_taken = 0
    # init_time = rospy.get_rostime().secs 
    # while(init_time <= 0):
    #     init_time = rospy.get_rostime().secs  
    # print 'init time recorded is ' + repr(init_time) +' secs'
    # #timer = rospy.Timer(rospy.Duration(1), my_callback)
    # while(time_taken<time):
    #     now = rospy.get_rostime().secs 
    #     time_taken =  now - init_time
        # result = twist([0.1,0,0,0,0,0.1])
    relative([0.6,0.8,1.3,0.4,1.9,2.7,0.5])

    motion_direction = 'rotate_clockwise'
    time = 1.0
    time_taken = 0
    init_time = rospy.get_rostime().secs 
    while(init_time <= 0):
        init_time = rospy.get_rostime().secs  
    print 'init time recorded is ' + repr(init_time) +' secs'
    #timer = rospy.Timer(rospy.Duration(1), my_callback)
    while(time_taken<time):
        now = rospy.get_rostime().secs 
        time_taken =  now - init_time
        result = twist([0.1,0,0,0,0,0.1])

