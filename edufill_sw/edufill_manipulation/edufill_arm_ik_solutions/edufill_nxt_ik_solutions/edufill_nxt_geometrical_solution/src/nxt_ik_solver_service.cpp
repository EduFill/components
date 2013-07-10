#include <ros/ros.h>
#include <sensor_msgs/JointState.h>

#include <iostream>
#include <assert.h>
#include <cmath>

#include <Eigen/Geometry>
#include <Eigen/Core>

#include <nxt_ik_solver.h>
#include <edufill_nxt_geometrical_solution/ik_service.h>


using namespace std;
using namespace Eigen;

ros::Time call_t;
ros::Time compute_t;
ros::Duration busy_t;

bool ik_solution_finder(edufill_nxt_geometrical_solution::ik_service::Request &req, edufill_nxt_geometrical_solution::ik_service::Response &res)
{
  // create vector containing the desired tool cartesian coordinates
  Eigen::Vector3d target_position(3);
  target_position(0) = req.xyz[0];
  target_position(1) = req.xyz[1];
  target_position(2) = req.xyz[2];
    
  // create vector containing the IK solution (size: 3 (joints) + 1 (type of solution) )
  Eigen::VectorXd solution(4);
  // assignment to improve call time (-80 microseconds)
  solution.setZero();
  
  // array containing the solutions
  std::vector<double> sol_container;
    
  for (int k=0; k<4; ++k)
  {
    // compute a specific solution
    call_t = ros::Time::now();
   
    solution = solve_ik(target_position, k);
    
    compute_t = ros::Time::now(); 
    
    busy_t = compute_t - call_t;
    cout << "Time required for computation of solution " << k <<": " << busy_t.toSec()*1000000 << " microseconds.\n\n";

    // if it's OK ( != -99 ) memorize it into the solutions array
    if (solution(0) != -99)
    {
      for (int i=0; i<4; ++i)
      {
        sol_container.push_back(solution(i));
      }
    } 
  }
  
  cout << "----------------------------------------------------------" << std::endl;

  // resize the joint_values message service to the size of the solutions container
  res.joint_values.resize(sol_container.size());
  for(unsigned int k=0; k < sol_container.size(); ++k)
  {
    res.joint_values[k] = sol_container[k];
  }
  return true;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "ik_solver_server");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("edufill_nxt_geometrical_solution/ik_service", ik_solution_finder);
  ROS_INFO("Ready to compute IK solution for desired tool position.");
  ros::spin();

  return 0;
}
