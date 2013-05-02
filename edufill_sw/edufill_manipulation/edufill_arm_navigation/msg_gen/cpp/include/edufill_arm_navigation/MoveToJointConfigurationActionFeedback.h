/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_manipulation/edufill_arm_navigation/msg/MoveToJointConfigurationActionFeedback.msg */
#ifndef EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONACTIONFEEDBACK_H
#define EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONACTIONFEEDBACK_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "std_msgs/Header.h"
#include "actionlib_msgs/GoalStatus.h"
#include "edufill_arm_navigation/MoveToJointConfigurationFeedback.h"

namespace edufill_arm_navigation
{
template <class ContainerAllocator>
struct MoveToJointConfigurationActionFeedback_ {
  typedef MoveToJointConfigurationActionFeedback_<ContainerAllocator> Type;

  MoveToJointConfigurationActionFeedback_()
  : header()
  , status()
  , feedback()
  {
  }

  MoveToJointConfigurationActionFeedback_(const ContainerAllocator& _alloc)
  : header(_alloc)
  , status(_alloc)
  , feedback(_alloc)
  {
  }

  typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
   ::std_msgs::Header_<ContainerAllocator>  header;

  typedef  ::actionlib_msgs::GoalStatus_<ContainerAllocator>  _status_type;
   ::actionlib_msgs::GoalStatus_<ContainerAllocator>  status;

  typedef  ::edufill_arm_navigation::MoveToJointConfigurationFeedback_<ContainerAllocator>  _feedback_type;
   ::edufill_arm_navigation::MoveToJointConfigurationFeedback_<ContainerAllocator>  feedback;


  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct MoveToJointConfigurationActionFeedback
typedef  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<std::allocator<void> > MoveToJointConfigurationActionFeedback;

typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback> MoveToJointConfigurationActionFeedbackPtr;
typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback const> MoveToJointConfigurationActionFeedbackConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace edufill_arm_navigation

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > {
  static const char* value() 
  {
    return "d706db0c7be1523d9b021b8ffeabde31";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xd706db0c7be1523dULL;
  static const uint64_t static_value2 = 0x9b021b8ffeabde31ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_arm_navigation/MoveToJointConfigurationActionFeedback";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > {
  static const char* value() 
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalStatus status\n\
MoveToJointConfigurationFeedback feedback\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.secs: seconds (stamp_secs) since epoch\n\
# * stamp.nsecs: nanoseconds since stamp_secs\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalStatus\n\
GoalID goal_id\n\
uint8 status\n\
uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n\
uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n\
uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n\
                            #   and has since completed its execution (Terminal State)\n\
uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n\
uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n\
                            #    to some failure (Terminal State)\n\
uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n\
                            #    because the goal was unattainable or invalid (Terminal State)\n\
uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n\
                            #    and has not yet completed execution\n\
uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n\
                            #    but the action server has not yet confirmed that the goal is canceled\n\
uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n\
                            #    and was successfully cancelled (Terminal State)\n\
uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n\
                            #    sent over the wire by an action server\n\
\n\
#Allow for the user to associate a string with GoalStatus for debugging\n\
string text\n\
\n\
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalID\n\
# The stamp should store the time at which this goal was requested.\n\
# It is used by an action server when it tries to preempt all\n\
# goals that were requested before a certain time\n\
time stamp\n\
\n\
# The id provides a way to associate feedback and\n\
# result message with specific goal requests. The id\n\
# specified must be unique.\n\
string id\n\
\n\
\n\
================================================================================\n\
MSG: edufill_arm_navigation/MoveToJointConfigurationFeedback\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# feedback\n\
arm_navigation_msgs/ArmNavigationErrorCodes result\n\
\n\
\n\
================================================================================\n\
MSG: arm_navigation_msgs/ArmNavigationErrorCodes\n\
int32 val\n\
\n\
# overall behavior\n\
int32 PLANNING_FAILED=-1\n\
int32 SUCCESS=1\n\
int32 TIMED_OUT=-2\n\
\n\
# start state errors\n\
int32 START_STATE_IN_COLLISION=-3\n\
int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-4\n\
\n\
# goal errors\n\
int32 GOAL_IN_COLLISION=-5\n\
int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-6\n\
\n\
# robot state\n\
int32 INVALID_ROBOT_STATE=-7\n\
int32 INCOMPLETE_ROBOT_STATE=-8\n\
\n\
# planning request errors\n\
int32 INVALID_PLANNER_ID=-9\n\
int32 INVALID_NUM_PLANNING_ATTEMPTS=-10\n\
int32 INVALID_ALLOWED_PLANNING_TIME=-11\n\
int32 INVALID_GROUP_NAME=-12\n\
int32 INVALID_GOAL_JOINT_CONSTRAINTS=-13\n\
int32 INVALID_GOAL_POSITION_CONSTRAINTS=-14\n\
int32 INVALID_GOAL_ORIENTATION_CONSTRAINTS=-15\n\
int32 INVALID_PATH_JOINT_CONSTRAINTS=-16\n\
int32 INVALID_PATH_POSITION_CONSTRAINTS=-17\n\
int32 INVALID_PATH_ORIENTATION_CONSTRAINTS=-18\n\
\n\
# state/trajectory monitor errors\n\
int32 INVALID_TRAJECTORY=-19\n\
int32 INVALID_INDEX=-20\n\
int32 JOINT_LIMITS_VIOLATED=-21\n\
int32 PATH_CONSTRAINTS_VIOLATED=-22\n\
int32 COLLISION_CONSTRAINTS_VIOLATED=-23\n\
int32 GOAL_CONSTRAINTS_VIOLATED=-24\n\
int32 JOINTS_NOT_MOVING=-25\n\
int32 TRAJECTORY_CONTROLLER_FAILED=-26\n\
\n\
# system errors\n\
int32 FRAME_TRANSFORM_FAILURE=-27\n\
int32 COLLISION_CHECKING_UNAVAILABLE=-28\n\
int32 ROBOT_STATE_STALE=-29\n\
int32 SENSOR_INFO_STALE=-30\n\
\n\
# kinematics errors\n\
int32 NO_IK_SOLUTION=-31\n\
int32 INVALID_LINK_NAME=-32\n\
int32 IK_LINK_IN_COLLISION=-33\n\
int32 NO_FK_SOLUTION=-34\n\
int32 KINEMATICS_STATE_IN_COLLISION=-35\n\
\n\
# general errors\n\
int32 INVALID_TIMEOUT=-36\n\
\n\
\n\
";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct HasHeader< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct HasHeader< const ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.header);
    stream.next(m.status);
    stream.next(m.feedback);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct MoveToJointConfigurationActionFeedback_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::edufill_arm_navigation::MoveToJointConfigurationActionFeedback_<ContainerAllocator> & v) 
  {
    s << indent << "header: ";
s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "status: ";
s << std::endl;
    Printer< ::actionlib_msgs::GoalStatus_<ContainerAllocator> >::stream(s, indent + "  ", v.status);
    s << indent << "feedback: ";
s << std::endl;
    Printer< ::edufill_arm_navigation::MoveToJointConfigurationFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.feedback);
  }
};


} // namespace message_operations
} // namespace ros

#endif // EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONACTIONFEEDBACK_H

