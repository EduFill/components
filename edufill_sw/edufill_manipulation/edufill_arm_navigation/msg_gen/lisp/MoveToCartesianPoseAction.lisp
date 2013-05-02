; Auto-generated. Do not edit!


(cl:in-package edufill_arm_navigation-msg)


;//! \htmlinclude MoveToCartesianPoseAction.msg.html

(cl:defclass <MoveToCartesianPoseAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type edufill_arm_navigation-msg:MoveToCartesianPoseActionGoal
    :initform (cl:make-instance 'edufill_arm_navigation-msg:MoveToCartesianPoseActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type edufill_arm_navigation-msg:MoveToCartesianPoseActionResult
    :initform (cl:make-instance 'edufill_arm_navigation-msg:MoveToCartesianPoseActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type edufill_arm_navigation-msg:MoveToCartesianPoseActionFeedback
    :initform (cl:make-instance 'edufill_arm_navigation-msg:MoveToCartesianPoseActionFeedback)))
)

(cl:defclass MoveToCartesianPoseAction (<MoveToCartesianPoseAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToCartesianPoseAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToCartesianPoseAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_arm_navigation-msg:<MoveToCartesianPoseAction> is deprecated: use edufill_arm_navigation-msg:MoveToCartesianPoseAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <MoveToCartesianPoseAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:action_goal-val is deprecated.  Use edufill_arm_navigation-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <MoveToCartesianPoseAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:action_result-val is deprecated.  Use edufill_arm_navigation-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <MoveToCartesianPoseAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_arm_navigation-msg:action_feedback-val is deprecated.  Use edufill_arm_navigation-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToCartesianPoseAction>) ostream)
  "Serializes a message object of type '<MoveToCartesianPoseAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToCartesianPoseAction>) istream)
  "Deserializes a message object of type '<MoveToCartesianPoseAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToCartesianPoseAction>)))
  "Returns string type for a message object of type '<MoveToCartesianPoseAction>"
  "edufill_arm_navigation/MoveToCartesianPoseAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToCartesianPoseAction)))
  "Returns string type for a message object of type 'MoveToCartesianPoseAction"
  "edufill_arm_navigation/MoveToCartesianPoseAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToCartesianPoseAction>)))
  "Returns md5sum for a message object of type '<MoveToCartesianPoseAction>"
  "a94144097d6bb8f5c6ec21dd5870f9a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToCartesianPoseAction)))
  "Returns md5sum for a message object of type 'MoveToCartesianPoseAction"
  "a94144097d6bb8f5c6ec21dd5870f9a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToCartesianPoseAction>)))
  "Returns full string definition for message of type '<MoveToCartesianPoseAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%MoveToCartesianPoseActionGoal action_goal~%MoveToCartesianPoseActionResult action_result~%MoveToCartesianPoseActionFeedback action_feedback~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MoveToCartesianPoseGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# goal~%geometry_msgs/PoseStamped goal~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MoveToCartesianPoseResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# result~%arm_navigation_msgs/ArmNavigationErrorCodes result~%~%================================================================================~%MSG: arm_navigation_msgs/ArmNavigationErrorCodes~%int32 val~%~%# overall behavior~%int32 PLANNING_FAILED=-1~%int32 SUCCESS=1~%int32 TIMED_OUT=-2~%~%# start state errors~%int32 START_STATE_IN_COLLISION=-3~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-4~%~%# goal errors~%int32 GOAL_IN_COLLISION=-5~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-6~%~%# robot state~%int32 INVALID_ROBOT_STATE=-7~%int32 INCOMPLETE_ROBOT_STATE=-8~%~%# planning request errors~%int32 INVALID_PLANNER_ID=-9~%int32 INVALID_NUM_PLANNING_ATTEMPTS=-10~%int32 INVALID_ALLOWED_PLANNING_TIME=-11~%int32 INVALID_GROUP_NAME=-12~%int32 INVALID_GOAL_JOINT_CONSTRAINTS=-13~%int32 INVALID_GOAL_POSITION_CONSTRAINTS=-14~%int32 INVALID_GOAL_ORIENTATION_CONSTRAINTS=-15~%int32 INVALID_PATH_JOINT_CONSTRAINTS=-16~%int32 INVALID_PATH_POSITION_CONSTRAINTS=-17~%int32 INVALID_PATH_ORIENTATION_CONSTRAINTS=-18~%~%# state/trajectory monitor errors~%int32 INVALID_TRAJECTORY=-19~%int32 INVALID_INDEX=-20~%int32 JOINT_LIMITS_VIOLATED=-21~%int32 PATH_CONSTRAINTS_VIOLATED=-22~%int32 COLLISION_CONSTRAINTS_VIOLATED=-23~%int32 GOAL_CONSTRAINTS_VIOLATED=-24~%int32 JOINTS_NOT_MOVING=-25~%int32 TRAJECTORY_CONTROLLER_FAILED=-26~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-27~%int32 COLLISION_CHECKING_UNAVAILABLE=-28~%int32 ROBOT_STATE_STALE=-29~%int32 SENSOR_INFO_STALE=-30~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%int32 INVALID_LINK_NAME=-32~%int32 IK_LINK_IN_COLLISION=-33~%int32 NO_FK_SOLUTION=-34~%int32 KINEMATICS_STATE_IN_COLLISION=-35~%~%# general errors~%int32 INVALID_TIMEOUT=-36~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MoveToCartesianPoseFeedback feedback~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# feedback~%arm_navigation_msgs/ArmNavigationErrorCodes result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToCartesianPoseAction)))
  "Returns full string definition for message of type 'MoveToCartesianPoseAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%MoveToCartesianPoseActionGoal action_goal~%MoveToCartesianPoseActionResult action_result~%MoveToCartesianPoseActionFeedback action_feedback~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MoveToCartesianPoseGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# goal~%geometry_msgs/PoseStamped goal~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MoveToCartesianPoseResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# result~%arm_navigation_msgs/ArmNavigationErrorCodes result~%~%================================================================================~%MSG: arm_navigation_msgs/ArmNavigationErrorCodes~%int32 val~%~%# overall behavior~%int32 PLANNING_FAILED=-1~%int32 SUCCESS=1~%int32 TIMED_OUT=-2~%~%# start state errors~%int32 START_STATE_IN_COLLISION=-3~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-4~%~%# goal errors~%int32 GOAL_IN_COLLISION=-5~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-6~%~%# robot state~%int32 INVALID_ROBOT_STATE=-7~%int32 INCOMPLETE_ROBOT_STATE=-8~%~%# planning request errors~%int32 INVALID_PLANNER_ID=-9~%int32 INVALID_NUM_PLANNING_ATTEMPTS=-10~%int32 INVALID_ALLOWED_PLANNING_TIME=-11~%int32 INVALID_GROUP_NAME=-12~%int32 INVALID_GOAL_JOINT_CONSTRAINTS=-13~%int32 INVALID_GOAL_POSITION_CONSTRAINTS=-14~%int32 INVALID_GOAL_ORIENTATION_CONSTRAINTS=-15~%int32 INVALID_PATH_JOINT_CONSTRAINTS=-16~%int32 INVALID_PATH_POSITION_CONSTRAINTS=-17~%int32 INVALID_PATH_ORIENTATION_CONSTRAINTS=-18~%~%# state/trajectory monitor errors~%int32 INVALID_TRAJECTORY=-19~%int32 INVALID_INDEX=-20~%int32 JOINT_LIMITS_VIOLATED=-21~%int32 PATH_CONSTRAINTS_VIOLATED=-22~%int32 COLLISION_CONSTRAINTS_VIOLATED=-23~%int32 GOAL_CONSTRAINTS_VIOLATED=-24~%int32 JOINTS_NOT_MOVING=-25~%int32 TRAJECTORY_CONTROLLER_FAILED=-26~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-27~%int32 COLLISION_CHECKING_UNAVAILABLE=-28~%int32 ROBOT_STATE_STALE=-29~%int32 SENSOR_INFO_STALE=-30~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%int32 INVALID_LINK_NAME=-32~%int32 IK_LINK_IN_COLLISION=-33~%int32 NO_FK_SOLUTION=-34~%int32 KINEMATICS_STATE_IN_COLLISION=-35~%~%# general errors~%int32 INVALID_TIMEOUT=-36~%~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MoveToCartesianPoseFeedback feedback~%~%================================================================================~%MSG: edufill_arm_navigation/MoveToCartesianPoseFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# feedback~%arm_navigation_msgs/ArmNavigationErrorCodes result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToCartesianPoseAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToCartesianPoseAction>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToCartesianPoseAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))
