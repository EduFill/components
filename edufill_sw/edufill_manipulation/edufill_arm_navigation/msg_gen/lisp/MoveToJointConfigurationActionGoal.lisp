; Auto-generated. Do not edit!


(cl:in-package edufill_arm_navigation-msg)


;//! \htmlinclude MoveToJointConfigurationActionGoal.msg.html

(cl:defclass <MoveToJointConfigurationActionGoal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (goal_id
    :reader goal_id
    :initarg :goal_id
    :type actionlib_msgs-msg:GoalID
    :initform (cl:make-instance 'actionlib_msgs-msg:GoalID))
   (goal
    :reader goal
    :initarg :goal
    :type edufill_arm_navigation-msg:MoveToJointConfigurationGoal
    :initform (cl:make-instance 'edufill_arm_navigation-msg:MoveToJointConfigurationGoal)))
)

(cl:defclass MoveToJointConfigurationActionGoal (<MoveToJointConfigurationActionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToJointConfigurationActionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToJointConfigurationActionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_arm_navigation-msg:<MoveToJointConfigurationActionGoal> is deprecated: use edufill_arm_navigation-msg:MoveToJointConfigurationActionGoal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MoveToJointConfigurationActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:header-val is deprecated.  Use edufill_arm_navigation-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'goal_id-val :lambda-list '(m))
(cl:defmethod goal_id-val ((m <MoveToJointConfigurationActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:goal_id-val is deprecated.  Use edufill_arm_navigation-msg:goal_id instead.")
  (goal_id m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <MoveToJointConfigurationActionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:goal-val is deprecated.  Use edufill_arm_navigation-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToJointConfigurationActionGoal>) ostream)
  "Serializes a message object of type '<MoveToJointConfigurationActionGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToJointConfigurationActionGoal>) istream)
  "Deserializes a message object of type '<MoveToJointConfigurationActionGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToJointConfigurationActionGoal>)))
  "Returns string type for a message object of type '<MoveToJointConfigurationActionGoal>"
  "edufill_arm_navigation/MoveToJointConfigurationActionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToJointConfigurationActionGoal)))
  "Returns string type for a message object of type 'MoveToJointConfigurationActionGoal"
  "edufill_arm_navigation/MoveToJointConfigurationActionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToJointConfigurationActionGoal>)))
  "Returns md5sum for a message object of type '<MoveToJointConfigurationActionGoal>"
  "5b80683170eaca6bd9e13ed4c57726a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToJointConfigurationActionGoal)))
  "Returns md5sum for a message object of type 'MoveToJointConfigurationActionGoal"
  "5b80683170eaca6bd9e13ed4c57726a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToJointConfigurationActionGoal>)))
  "Returns full string definition for message of type '<MoveToJointConfigurationActionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MoveToJointConfigurationGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToJointConfigurationGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# goal~%brics_actuator/JointPositions goal~%~%================================================================================~%MSG: brics_actuator/JointPositions~%Poison poisonStamp~%JointValue[] positions~%~%================================================================================~%MSG: brics_actuator/Poison~%string originator 		# node id~%string description 		# encoding still an issue~%float32 qos			# reliability of the channel~%				# 0..1 where 1 means healthy~%~%================================================================================~%MSG: brics_actuator/JointValue~%time timeStamp 		#time of the data ~%string joint_uri~%string unit 		#if empy expects si units, you can use boost::unit~%float64 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToJointConfigurationActionGoal)))
  "Returns full string definition for message of type 'MoveToJointConfigurationActionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MoveToJointConfigurationGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToJointConfigurationGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# goal~%brics_actuator/JointPositions goal~%~%================================================================================~%MSG: brics_actuator/JointPositions~%Poison poisonStamp~%JointValue[] positions~%~%================================================================================~%MSG: brics_actuator/Poison~%string originator 		# node id~%string description 		# encoding still an issue~%float32 qos			# reliability of the channel~%				# 0..1 where 1 means healthy~%~%================================================================================~%MSG: brics_actuator/JointValue~%time timeStamp 		#time of the data ~%string joint_uri~%string unit 		#if empy expects si units, you can use boost::unit~%float64 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToJointConfigurationActionGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToJointConfigurationActionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToJointConfigurationActionGoal
    (cl:cons ':header (header msg))
    (cl:cons ':goal_id (goal_id msg))
    (cl:cons ':goal (goal msg))
))
