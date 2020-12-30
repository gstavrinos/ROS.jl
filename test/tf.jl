
ROS.@include geometry_msgs: TransformStamped, PoseStamped, PointStamped, Vector3Stamped, Quaternion

ROS.init("testTF")
nh = ROS.NodeHandle()

b = ROS.tf.TransformBroadcaster()
sb = ROS.tf.StaticTransformBroadcaster()
bf = ROS.tf.Buffer()
tl = ROS.tf.TransformListener(bf)

ts = ROS.geometry_msgs_TransformStamped()
ts.header.stamp = ROS.now()
ts.header.frame_id = "base_link"
ts.child_frame_id = "gps_link"
ts.transform.translation.y = 1.6
ts.transform.rotation.w = 1
ts2 = ROS.geometry_msgs_TransformStamped()
ts2.header.stamp = ROS.now()
ts2.header.frame_id = "base_link"
ts2.child_frame_id = "camera_link"
ts2.transform.translation.x = 0.3
ts2.transform.rotation.w = 1
tss = [ts,ts2]

ROS.tf.sendTransform(b, ts)
ROS.tf.sendTransform(b, tss)
ROS.tf.sendTransform(sb, ts)
ROS.tf.sendTransform(sb, tss)

@test ROS.tf.canTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
@test ROS.tf.canTransform(bf, "gps_link", ROS.Time(0), "camera_link", ROS.Time(0), "base_link", ROS.Duration(1))

ROS.tf.lookupTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
ROS.tf.lookupTransform(bf, "gps_link", ROS.Time(0), "camera_link", ROS.Time(0), "base_link", ROS.Duration(1))

p = ROS.geometry_msgs_PoseStamped()
p.header.frame_id = "camera_link"
p.pose.position.x = 1
p.pose.position.y = 0.6
p.pose.orientation.w = 1

ROS.tf.transform(bf, p, "gps_link", ROS.Time(0), "base_link", ROS.Duration(2))
ROS.tf.transform(bf, p, "base_link", ROS.Duration(2))

p = ROS.geometry_msgs_PointStamped()
p.header.frame_id = "camera_link"
p.point.x = 1
p.point.y = 0.6

ROS.tf.transform(bf, p, "gps_link", ROS.Time(0), "base_link", ROS.Duration(2))
ROS.tf.transform(bf, p, "base_link", ROS.Duration(2))

p = ROS.geometry_msgs_Vector3Stamped()
p.header.frame_id = "camera_link"
p.vector.x = 1
p.vector.y = 0.6

ROS.tf.transform(bf, p, "gps_link", ROS.Time(0), "base_link", ROS.Duration(2))
ROS.tf.transform(bf, p, "base_link", ROS.Duration(2))

q1 = ROS.geometry_msgs_Quaternion()
q1.z = 1
q1.w = 1
q1 = ROS.tf.normalize(q1)
@test q1.z ≈ 0.707 atol=1e-03
q2 = ROS.tf.setRPY(float(π), 0, 0.00001)
@test q2.x ≈ 1 atol=0.01
q3 = q1*q2
q4 = q2+q1
@test (q1-q2).x ≈ -1 atol=0.01 
@test (-q1).z == -q1.z 
axis = ROS.tf.getAxis(q3)
@test axis[1] ≈ 0.707 atol=0.01 
@test axis[2] ≈ 0.707 atol=0.01 
@test axis[3] ≈ 0 atol=0.01 

@test ROS.tf.angle(q1, q2) ≈ π/2 atol=0.01
@test ROS.tf.angleShortestPath(q1, q2) ≈ π atol=0.01
@test ROS.tf.dot(q1, q2) ≈ 0 atol=0.01
@test ROS.tf.getAngle(q1) ≈ π/2 atol=0.01
@test ROS.tf.getAngleShortestPath(q1) ≈ π/2 atol=0.01
@test ROS.tf.length(q2) ≈ 1 atol=0.01
@test ROS.tf.length2(q3) ≈ 1 atol=0.01
@test ROS.tf.inverse(q1).z == -q1.z 

q5 = ROS.tf.setEuler(0, 0, float(π))
@test q5.x ≈ 0 atol=0.01
@test q5.y ≈ 0 atol=0.01
@test q5.z ≈ 1 atol=0.01
@test q5.w ≈ 0 atol=0.01

q6 = ROS.tf.slerp(q1, q5, 0.3)
@test q6.x ≈ 0 atol=0.01
@test q6.y ≈ 0 atol=0.01
@test q6.z ≈ 0.85 atol=0.01
@test q6.w ≈ 0.52 atol=0.01

q7 = ROS.tf.setRotation(q1, [1,0,0], float(π/2))
@test q7.x ≈ 0.707 atol=1e-03
@test q7.y ≈ 0 atol=0.01
@test q7.z ≈ 0 atol=0.01
@test q7.w ≈ 0.707 atol=1e-03

println("All $(basename(@__FILE__)) tests passed.")
