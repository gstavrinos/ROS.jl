ROS.@include std_msgs: Float64MultiArray
@ROS.include geometry_msgs: PoseStamped
@ROS.include sensor_msgs: Image
@ROS.include nav_msgs: Path

function testPublisher()
    ROS.init("testPub")
    nh = ROS.NodeHandle()

    pub = ROS.advertise(nh, "test_sub", ROS.std_msgs_Float64MultiArray, 1)

    robotp = ROS.geometry_msgs_PoseStamped()
    robotp.pose.position.x = 0
    robotp.pose.position.y = 0
    robotp.pose.position.z = 3
    robotp.pose.orientation.x = 0
    robotp.pose.orientation.y = 0
    robotp.pose.orientation.z = 0
    robotp.pose.orientation.w = 1

    path = ROS.nav_msgs_Path()
    path.header.stamp = ROS.now()
    path.header.frame_id = "world"
    v = []
    push!(v, robotp)
    path.poses = v
    img = ROS.sensor_msgs_Image()
    img.data = UInt8.([1,2,3,4,5])

    ROS.getNumSubscribers(pub)
    @test ROS.getTopic(pub) == "/test_sub"
    @test ! ROS.isLatched(pub)

    loop = 50
    while loop > 0
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.publish(pub, ROS.std_msgs_Float64MultiArray())
        ROS.spinOnce()
    end
    ROS.shutdown(pub)
    println("All $(basename(@__FILE__)) tests passed.")
end

