; Auto-generated. Do not edit!


(cl:in-package edufill_script_server-msg)


;//! \htmlinclude StateFeedback.msg.html

(cl:defclass <StateFeedback> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StateFeedback (<StateFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name edufill_script_server-msg:<StateFeedback> is deprecated: use edufill_script_server-msg:StateFeedback instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateFeedback>) ostream)
  "Serializes a message object of type '<StateFeedback>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateFeedback>) istream)
  "Deserializes a message object of type '<StateFeedback>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateFeedback>)))
  "Returns string type for a message object of type '<StateFeedback>"
  "edufill_script_server/StateFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateFeedback)))
  "Returns string type for a message object of type 'StateFeedback"
  "edufill_script_server/StateFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateFeedback>)))
  "Returns md5sum for a message object of type '<StateFeedback>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateFeedback)))
  "Returns md5sum for a message object of type 'StateFeedback"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateFeedback>)))
  "Returns full string definition for message of type '<StateFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback definition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateFeedback)))
  "Returns full string definition for message of type 'StateFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#feedback definition~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateFeedback>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'StateFeedback
))
