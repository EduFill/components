/******************************************************************************
 * Copyright (c) 2013
 * All rights reserved.
 *
 * Edufill project 
 * Hochschule Bonn-Rhein-Sieg
 * University of Applied Sciences
 * Computer Science Department
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * Author:
 * Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
 * 
 * Supervised by:
 * Rhama Dwiputra, Bjoern Kahl
 *
 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 * This software is published under a dual-license: GNU Lesser General Public
 * License LGPL 2.1 and BSD license. The dual-license implies that users of this
 * code may choose which terms they prefer.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * * Neither the name of Locomotec nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License LGPL as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version or the BSD license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License LGPL and the BSD license for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License LGPL and BSD license along with this program.
 *
 ******************************************************************************/
#include <ros/ros.h>

#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Pose.h>

#include <iostream>
#include <assert.h>
#include <cmath>

#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>
#include <boost/units/systems/si/length.hpp>
#include <boost/units/systems/si/plane_angle.hpp>
#include <boost/units/io.hpp>
#include <boost/units/systems/angle/degrees.hpp>
#include <boost/units/conversion.hpp>

#include <Eigen/Geometry>
#include "/usr/include/eigen3/Eigen/src/Geometry/Quaternion.h"
#include "/usr/include/eigen3/Eigen/src/Core/Matrix.h"

#define DEG2RAD M_PI/180

using namespace Eigen;
using namespace std;

Eigen::VectorXf solve_ik(Eigen::Matrix3f goalR, Eigen::Vector3f goalT,int sol_index)
{
	
	cout << "[SOLVER] Solution " << sol_index << std::endl; 
	
  Eigen::VectorXf result(5);
  //~ index:
  //~ 0   direct space, low elbow
  //~ 1   direct space, high elbow
  //~ 2   inverse space, high elbow
  //~ 3   inverse space, low elbow
  
  Eigen::Matrix<float,5,4> DH;
  DH.row(0) << 0.0,   0.019,  0.0330,   M_PI/2;
  DH.row(1) << 0.0,   0.0,    0.1550,   0.0;
  DH.row(2) << 0.0,   0.0,    0.1350,   0.0;
  DH.row(3) << 0.0,   0.0,    0.0,      M_PI/2;
  DH.row(4) << 0.0,   0.2175, 0.0,      0.0;
  
  //~ from homing to DH structure
  //~ offset =  [deg2rad(169) deg2rad(65+90) -deg2rad(146) deg2rad(102-90) deg2rad(167)];
  
  Eigen::VectorXf offset(5);
  offset(0) = 169*DEG2RAD;
  offset(1) = 155*DEG2RAD;
  offset(2) = -146*DEG2RAD;
  offset(3) = 192*DEG2RAD;
  offset(4) = 167*DEG2RAD;
  
  float L2 = 0.155;
  float L3 = 0.135;
  float L4 = 0.2175;
  float beta = atan2(goalR(2,2), sqrt( pow(goalR(0,2),2) + pow(goalR(1,2),2) ) );
  
  float q1, q2, q3, q4, q5, Z1, Z2, X1, X2;
  float sin_theta3, cos_theta3, theta3, theta2;
  
  
  if (sol_index == 0 || sol_index == 1)
  {
    //~ direct arm space
    q1 = atan2(goalT(1),goalT(0));
    Z1 = goalT(2) - DH(0,1);
    Z2 = Z1 - L4*sin(beta);
    X1 = sqrt( pow(goalT(0),2) + pow(goalT(1),2)  ) - DH(0,2);
    X2 = X1 - L4*cos(beta);
  }
  else
  {
    //~ inverse arm space
    q1 = atan2(goalT(1),goalT(0)) - M_PI;
    Z1 = goalT(2) - DH(0,1);
    Z2 = Z1 - L4*sin(beta);
    X1 = sqrt( pow(goalT(0),2) + pow(goalT(1),2)  ) + DH(0,2);
    X2 = X1 - L4*cos(beta);
  }
  
  cos_theta3 = (-pow(Z2,2) -pow(X2,2) + pow(L2,2) + pow(L3,2)) / (2*L2*L3);
  
  if (cos_theta3 > -1 && cos_theta3 < 1)
  {
    // joint 3
    if (sol_index == 0 || sol_index == 2)
    {   
      sin_theta3 = sqrt(1-pow(cos_theta3,2));
      theta3 = atan2(sin_theta3,cos_theta3); 
      q3 = M_PI - theta3;
    }
    else
    {
      sin_theta3 = -sqrt(1-pow(cos_theta3,2));
      theta3 = atan2(sin_theta3,cos_theta3);
      q3 = - M_PI - theta3;
    }
    
    // joint 2
    float k1 = L2 + L3*cos(q3);
    float k2 = L3*sin(q3);
    
    if (sol_index == 0 || sol_index == 1)
    {    
      theta2 = atan2(Z2,X2) - atan2(k2,k1);
      q2 = theta2;
      // joint 4
      q4 = (M_PI/2) - (q2 + q3 - beta);
    }
    else
    {
      theta2 = atan2(Z2,X2) + atan2(k2,k1);
      q2 = M_PI - theta2;
      // joint 4
      q4 = ( M_PI - (q2 + q3) - beta) + M_PI/2;
    }
    
    
    Eigen::MatrixXf T(4,4);
    T = Eigen::MatrixXf::Identity(4,4);
    Eigen::Vector4f joints(q1,q2,q3,q4);
    float j, d, a, alpha;
    for (int k=0; k<4; ++k)
    {
      j = joints(k);
      d = DH(k,1);
      a = DH(k,2);
      alpha = DH(k,3);
      
      // component transform matrix
      Eigen::Matrix<float,4,4> CTM;
      CTM.row(0) << cos(j), -sin(j)*cos(alpha),   sin(j)*sin(alpha),    a*cos(j);
      CTM.row(1) << sin(j), cos(j)*cos(alpha),    -cos(j)*sin(alpha),   a*sin(j);    
      CTM.row(2) << 0.0,        sin(alpha),               cos(alpha),               d;
      CTM.row(3) << 0.0,        0.0,                      0.0,                      1;
      
      T = T * CTM;
    }
    Eigen::Matrix3f tool = T.block(0,0,3,3);
    Eigen::Matrix3f roll =  tool.transpose() * goalR;
    q5 = atan2(roll(1,0),roll(0,0));
    T = Eigen::MatrixXf::Identity(4,4);

    //~ The setpoint angle for joint arm_joint_1 is out of range. The valid range is between 0.0100692 rad and 5.84014 rad 
    //~ The setpoint angle for joint arm_joint_2 is out of range. The valid range is between 0.0100692 rad and 2.61799 rad 
    //~ The setpoint angle for joint arm_joint_3 is out of range. The valid range is between -5.02655 rad and -0.015708 rad 
    //~ The setpoint angle for joint arm_joint_4 is out of range. The valid range is between 0.0221239 rad and 3.4292 rad 
    //~ The setpoint angle for joint arm_joint_5 is out of range. The valid range is between 0.110619 rad and 5.64159 rad 
  
    result(0) = offset(0)-q1;
    result(1) = offset(1)-q2;
    result(2) = offset(2)-q3;
    result(3) = offset(3)-q4;
    result(4) = offset(4)-q5;
    
    if (result(4) < 0.110619 )
    {
			result(4) = result(4) + M_PI;
		}
		else if ( result(4) > 5.64159)
		{
			result(4) = result(4) - M_PI;
		}
  }
  else
  {
    // position not reachable: arm will stand still (we will give impossible values for the default controller)
    result = result.setConstant(-10);
  
  }
  
  Eigen::Matrix<float,5,2> range;
  range.row(0) << 0.0100692+0.0017,  5.84014-0.0017;
  range.row(1) << 0.0100692+0.0017,  2.61799-0.0017;
  range.row(2) << -5.02655+0.0017,   -0.015708-0.0017;
  range.row(3) << 0.0221239+0.0017,  3.4292-0.0017; 
  range.row(4) << 0.110619+0.0017,   5.64159-0.0017; 
  
  for(int k=0; k<5; ++k)
  {
    if( result(k) == -10)
    {
      cout << "[SOLVER] Solution " << sol_index << " discarded: desired goal not reachable by the robot" << std::endl;
      result = result.setZero();
      k = 5;
    }
    else if( range(k,0) > result(k) || range(k,1) < result(k) )
    {
      cout << "[SOLVER] Solution " << sol_index << " discarded: joint " << k+1 << " outside accetable ranges. Value: " << result(k) << "; Range: [" << range(k,0) << " , " << range(k,1) << "]" << std::endl;
      result = result.setZero();
      k = 5;
    }
    else
    {
    }
  }
  cout << "----------" << std::endl;
	return result;  
}
