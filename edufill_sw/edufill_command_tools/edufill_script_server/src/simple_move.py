#!/usr/bin/env python
import roslib; roslib.load_manifest('edufill_script_server')
import rospy
import brics_actuator.msg

from brics_actuator.msg import JointPositions, JointValue, Poison

import sys, select, termios, tty, signal

if __name__=="__main__":
    
    pub = rospy.Publisher('arm_1/arm_controller/position_command', JointPositions)
    
    rospy.init_node('simple_arm_gripper_position')

    rospy.sleep(0.5)
    
    try:
        jp = JointPositions()
        
        jv1 = JointValue()
        jv1.joint_uri = "arm_joint_1"
        jv1.value = 0.1
        jv1.unit = "rad"
        
        jv2 = JointValue()
        jv2.joint_uri = "arm_joint_2"
        jv2.value = 0.1
        jv2.unit = "rad"

        jv3 = JointValue()
        jv3.joint_uri = "arm_joint_3"
        jv3.value = -0.1
        jv3.unit = "rad"
        
        jv4 = JointValue()
        jv4.joint_uri = "arm_joint_4"
        jv4.value = 0.1
        jv4.unit = "rad"
        
        jv5 = JointValue()
        jv5.joint_uri = "arm_joint_5"
        jv5.value = 0.1
        jv5.unit = "rad"
        

        p = Poison()
        print p
       
        jp.poisonStamp = p
        
        jp.positions = [jv1, jv2, jv3, jv4, jv5]
       
        pub.publish(jp)
        pub.publish(jp)

        
    except Exception, e:
        print e



