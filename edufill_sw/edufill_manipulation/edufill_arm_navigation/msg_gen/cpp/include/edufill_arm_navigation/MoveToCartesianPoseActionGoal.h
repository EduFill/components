/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_manipulation/edufill_arm_navigation/msg/MoveToCartesianPoseActionGoal.msg */
#ifndef EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOCARTESIANPOSEACTIONGOAL_H
#define EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOCARTESIANPOSEACTIONGOAL_H
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
#include "actionlib_msgs/GoalID.h"
#include "edufill_arm_navigation/MoveToCartesianPoseGoal.h"

namespace edufill_arm_navigation
{
template <class ContainerAllocator>
struct MoveToCartesianPoseActionGoal_ {
  typedef MoveToCartesianPoseActionGoal_<ContainerAllocator> Type;

  MoveToCartesianPoseActionGoal_()
  : header()
  , goal_id()
  , goal()
  {
  }

  MoveToCartesianPoseActionGoal_(const ContainerAllocator& _alloc)
  : header(_alloc)
  , goal_id(_alloc)
  , goal(_alloc)
  {
  }

  typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
   ::std_msgs::Header_<ContainerAllocator>  header;

  typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
   ::actionlib_msgs::GoalID_<ContainerAllocator>  goal_id;

  typedef  ::edufill_arm_navigation::MoveToCartesianPoseGoal_<ContainerAllocator>  _goal_type;
   ::edufill_arm_navigation::MoveToCartesianPoseGoal_<ContainerAllocator>  goal;


  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct MoveToCartesianPoseActionGoal
typedef  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<std::allocator<void> > MoveToCartesianPoseActionGoal;

typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal> MoveToCartesianPoseActionGoalPtr;
typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal const> MoveToCartesianPoseActionGoalConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace edufill_arm_navigation

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "afd96e4a34a69ea5ef07941841344f11";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xafd96e4a34a69ea5ULL;
  static const uint64_t static_value2 = 0xef07941841344f11ULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_arm_navigation/MoveToCartesianPoseActionGoal";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalID goal_id\n\
MoveToCartesianPoseGoal goal\n\
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
MSG: edufill_arm_navigation/MoveToCartesianPoseGoal\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# goal\n\
geometry_msgs/PoseStamped goal\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of postion and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
\n\
";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct HasHeader< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct HasHeader< const ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.header);
    stream.next(m.goal_id);
    stream.next(m.goal);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct MoveToCartesianPoseActionGoal_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::edufill_arm_navigation::MoveToCartesianPoseActionGoal_<ContainerAllocator> & v) 
  {
    s << indent << "header: ";
s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
s << std::endl;
    Printer< ::edufill_arm_navigation::MoveToCartesianPoseGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};


} // namespace message_operations
} // namespace ros

#endif // EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOCARTESIANPOSEACTIONGOAL_H

