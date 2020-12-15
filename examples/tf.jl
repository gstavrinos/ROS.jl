using ROS
ROS.@include geometry_msgs: TransformStamped, PoseStamped

function init()
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
    ts.transform.translation.x = 2.3
    ts.transform.translation.y = 1.6
    ts.transform.rotation.w = 1
    ts2 = ROS.geometry_msgs_TransformStamped()
    ts2.header.stamp = ROS.now()
    ts2.header.frame_id = "base_link"
    ts2.child_frame_id = "camera_link"
    ts2.transform.translation.x = 0.3
    ts2.transform.translation.y = 1
    ts2.transform.rotation.w = 1

    ROS.tf.sendTransform(b, ts)

    # Send multiple TFs at once
    tss = [ts,ts2]
    ROS.tf.sendTransform(sb, tss)

    if ROS.tf.canTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
        stamped = ROS.tf.lookupTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
        println(stamped.transform.translation.x)
        println(stamped.header.frame_id)

        p = ROS.geometry_msgs_PoseStamped()
        p.header.frame_id = "camera_link"
        p.pose.position.x = 1
        p.pose.position.y = 0.6
        p.pose.orientation.w = 1
        try
            transformed = ROS.tf.transform(bf, p, "base_link", ROS.Time(0), "gps_link", ROS.Duration(1))
            println(transformed.pose.position.x)
        catch
            println("TF Exception :(")
        end
    end
end

init()

