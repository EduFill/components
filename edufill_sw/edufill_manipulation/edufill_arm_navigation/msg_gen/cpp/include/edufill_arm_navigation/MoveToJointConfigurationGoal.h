/* Auto-generated by genmsg_cpp for file /home/nemogiftsun/youBot/Edufill/components/edufill_sw/edufill_manipulation/edufill_arm_navigation/msg/MoveToJointConfigurationGoal.msg */
#ifndef EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONGOAL_H
#define EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONGOAL_H
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

#include "brics_actuator/JointPositions.h"

namespace edufill_arm_navigation
{
template <class ContainerAllocator>
struct MoveToJointConfigurationGoal_ {
  typedef MoveToJointConfigurationGoal_<ContainerAllocator> Type;

  MoveToJointConfigurationGoal_()
  : goal()
  {
  }

  MoveToJointConfigurationGoal_(const ContainerAllocator& _alloc)
  : goal(_alloc)
  {
  }

  typedef  ::brics_actuator::JointPositions_<ContainerAllocator>  _goal_type;
   ::brics_actuator::JointPositions_<ContainerAllocator>  goal;


  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct MoveToJointConfigurationGoal
typedef  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<std::allocator<void> > MoveToJointConfigurationGoal;

typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationGoal> MoveToJointConfigurationGoalPtr;
typedef boost::shared_ptr< ::edufill_arm_navigation::MoveToJointConfigurationGoal const> MoveToJointConfigurationGoalConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace edufill_arm_navigation

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "474d9ddf2f29adac0f733d9f029bd72f";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x474d9ddf2f29adacULL;
  static const uint64_t static_value2 = 0x0f733d9f029bd72fULL;
};

template<class ContainerAllocator>
struct DataType< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "edufill_arm_navigation/MoveToJointConfigurationGoal";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> > {
  static const char* value() 
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# goal\n\
brics_actuator/JointPositions goal\n\
\n\
================================================================================\n\
MSG: brics_actuator/JointPositions\n\
Poison poisonStamp\n\
JointValue[] positions\n\
\n\
================================================================================\n\
MSG: brics_actuator/Poison\n\
string originator 		# node id\n\
string description 		# encoding still an issue\n\
float32 qos			# reliability of the channel\n\
				# 0..1 where 1 means healthy\n\
\n\
================================================================================\n\
MSG: brics_actuator/JointValue\n\
time timeStamp 		#time of the data \n\
string joint_uri\n\
string unit 		#if empy expects si units, you can use boost::unit\n\
float64 value\n\
\n\
";
  }

  static const char* value(const  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.goal);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct MoveToJointConfigurationGoal_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::edufill_arm_navigation::MoveToJointConfigurationGoal_<ContainerAllocator> & v) 
  {
    s << indent << "goal: ";
s << std::endl;
    Printer< ::brics_actuator::JointPositions_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};


} // namespace message_operations
} // namespace ros

#endif // EDUFILL_ARM_NAVIGATION_MESSAGE_MOVETOJOINTCONFIGURATIONGOAL_H

