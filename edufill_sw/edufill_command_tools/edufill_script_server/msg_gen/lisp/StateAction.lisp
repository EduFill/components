; Auto-generated. Do not edit!


(cl:in-package edufill_script_server-msg)


;//! \htmlinclude StateAction.msg.html

(cl:defclass <StateAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type edufill_script_server-msg:StateActionGoal
    :initform (cl:make-instance 'edufill_script_server-msg:StateActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type edufill_script_server-msg:StateActionResult
    :initform (cl:make-instance 'edufill_script_server-msg:StateActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type edufill_script_server-msg:StateActionFeedback
    :initform (cl:make-instance 'edufill_script_server-msg:StateActionFeedback)))
)

(cl:defclass StateAction (<StateAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_script_server-msg:<StateAction> is deprecated: use edufill_script_server-msg:StateAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <StateAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:action_goal-val is deprecated.  Use edufill_script_server-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <StateAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:action_result-val is deprecated.  Use edufill_script_server-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <StateAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader edufill_script_server-msg:action_feedback-val is deprecated.  Use edufill_script_server-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateAction>) ostream)
  "Serializes a message object of type '<StateAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateAction>) istream)
  "Deserializes a message object of type '<StateAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateAction>)))
  "Returns string type for a message object of type '<StateAction>"
  "edufill_script_server/StateAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateAction)))
  "Returns string type for a message object of type 'StateAction"
  "edufill_script_server/StateAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateAction>)))
  "Returns md5sum for a message object of type '<StateAction>"
  "8053233aa3e0dd581f127cd6e23e3f9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateAction)))
  "Returns md5sum for a message object of type 'StateAction"
  "8053233aa3e0dd581f127cd6e23e3f9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateAction>)))
  "Returns full string definition for message of type '<StateAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%StateActionGoal action_goal~%StateActionResult action_result~%StateActionFeedback action_feedback~%~%================================================================================~%MSG: edufill_script_server/StateActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%StateGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_script_server/StateGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%edufill_script_server/ScriptState state~%~%================================================================================~%MSG: edufill_script_server/ScriptState~%Header header~%int16 number~%string function_name~%string component_name~%string parameter_name~%string full_graph_name~%~%# Possible execution states~%byte UNKNOWN=0~%byte ACTIVE=1~%byte SUCCEEDED=2~%byte FAILED=3~%byte PAUSED=4~%~%byte state # state of execution~%int16 error_code # current error_code for state~%~%================================================================================~%MSG: edufill_script_server/StateActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%StateResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: edufill_script_server/StateResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int16 return_value~%~%================================================================================~%MSG: edufill_script_server/StateActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%StateFeedback feedback~%~%================================================================================~%MSG: edufill_script_server/StateFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback definition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateAction)))
  "Returns full string definition for message of type 'StateAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%StateActionGoal action_goal~%StateActionResult action_result~%StateActionFeedback action_feedback~%~%================================================================================~%MSG: edufill_script_server/StateActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%StateGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: edufill_script_server/StateGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%edufill_script_server/ScriptState state~%~%================================================================================~%MSG: edufill_script_server/ScriptState~%Header header~%int16 number~%string function_name~%string component_name~%string parameter_name~%string full_graph_name~%~%# Possible execution states~%byte UNKNOWN=0~%byte ACTIVE=1~%byte SUCCEEDED=2~%byte FAILED=3~%byte PAUSED=4~%~%byte state # state of execution~%int16 error_code # current error_code for state~%~%================================================================================~%MSG: edufill_script_server/StateActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%StateResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: edufill_script_server/StateResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int16 return_value~%~%================================================================================~%MSG: edufill_script_server/StateActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%StateFeedback feedback~%~%================================================================================~%MSG: edufill_script_server/StateFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback definition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateAction>))
  "Converts a ROS message object to a list"
  (cl:list 'StateAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))
