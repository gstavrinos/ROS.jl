
ROS.@include geometry_msgs: TransformStamped, PoseStamped, PointStamped, Vector3Stamped

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

println("All $(basename(@__FILE__)) tests passed.")