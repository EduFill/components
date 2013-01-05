#include <ros/ros.h>
#include <std_msgs/String.h>
#include <iostream>
#include <sstream>
#include <edufill_srvs/GetPoseStamped.h>
#include <tf/transform_datatypes.h>
#include <tf/LinearMath/Matrix3x3.h>
#include <XmlRpcValue.h>
//#include <LinearMath/btQuaternion.h>

#include "placement_wrt_object/HomogenousTransform.h"
#include "placement_wrt_object/KinematicSolver.h"


using namespace std;
/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */

bool calculateOptimalBasePose(edufill_srvs::GetPoseStamped::Request  &req,
         edufill_srvs::GetPoseStamped::Response &res )
{
	  tf::Quaternion q;
	  double roll_obj, pitch_obj, yaw_obj;
	  
	  Pose Goal;
	  JointParameter prefConfig(1,8);

      bool isValid = true;
      
      ros::NodeHandle n;

      XmlRpc::XmlRpcValue joint_values;
      XmlRpc::XmlRpcValue costmap_resolution;

      n.getParam("/script_server/arm/pregrasp_laying_mex", joint_values);

      n.getParam("/move_base/global_costmap/resolution", costmap_resolution);
      



      prefConfig << 0,0,0,(double) joint_values[0],(double) joint_values[1],(double) joint_values[2],(double) joint_values[3],(double) joint_values[4];
    
      

	  // Request Processing
      KinematicSolver youBot((double) costmap_resolution);  
   
	  float x_obj = req.object_pose.pose.position.x;
	  float y_obj = req.object_pose.pose.position.y;
	  float z_obj = req.object_pose.pose.position.z;
	  tf::quaternionMsgToTF(req.object_pose.pose.orientation, q);
	  tf::Matrix3x3(q).getRPY(roll_obj, pitch_obj, yaw_obj); 
      
      //Roll and Pitch are not really necessary for evaluating the base position
      roll_obj  = 0;
      pitch_obj = 0;
      
	  Goal << x_obj,y_obj,z_obj,roll_obj, pitch_obj, yaw_obj;

	  

	  youBot.solveIK(Goal,prefConfig,isValid);

	  // Response 

	  res.base_pose.pose.position.x = prefConfig(0);
	  res.base_pose.pose.position.y = prefConfig(1);
	  res.base_pose.pose.position.z = 0;
	  tf::quaternionTFToMsg(tf::createQuaternionFromRPY(0,0,prefConfig(2)),res.base_pose.pose.orientation);

	  return true;
}

int main(int argc, char **argv)
{  
  ros::init(argc, argv, "kinematics_server");

  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("calculateOptimalBasePose", calculateOptimalBasePose);  

/*
  JointParameter prefConfig(1,8);
    
      XmlRpc::XmlRpcValue joint_values;
      n.getParam("/script_server/arm/pregrasp_laying_mex",joint_values);
      cout << "The j value is "<<joint_values[1]<<endl;
      prefConfig << 0,0,0,(double) joint_values[1],(double) joint_values[2],(double) joint_values[3],(double) joint_values[4],(double) joint_values[5];

        ROS_INFO("prefConfig(4) = %f",prefConfig(3));   
        float tempt2=deg2rad(180)+prefConfig(3);
        float t2 = tempt2>deg2rad(180)?(deg2rad(360)-tempt2):tempt2;
        ROS_INFO("t2 = %f",t2);
  
  HomogenousTransform A = ht_from_xyzrpy(0.5,0.5,0.5,0.5,0.5,0.5);
  //cout << A.rotation().transpose();
  Pose Goal;
  KinematicSolver youBot;
  Goal << 0.4,0.3,0.5,0.5,0.5,0.5;
  JointParameter prefConfig(1,8);
  HomogenousTransform C = ht_from_eul(3.1416,-3.1416/2,0);
  //cout<< "The eul is " <<endl<<C.affine()<<endl;
  //Normalize(C);
  //cout<< "The norm eul is " <<endl<<C.affine()<<endl;
  prefConfig << 0.01,0.01,0.5,0.5,0.5,0.5,0.5,0.5;
  //cout << (youBot.calculateForwardKinematics(prefConfig)).affine()<<endl; 
  youBot.solveIK(Goal,prefConfig);
  cout << prefConfig;*/

  ROS_INFO("Ready to estimate base position");
  ros::spin();
  return 0;
}
