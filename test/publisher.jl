ROS.@include std_msgs: Float64MultiArray

function testPublisher()
    ROS.init("testPub")
    nh = ROS.NodeHandle()

    pub = ROS.advertise(nh, "test_sub", ROS.std_msgs_Float64MultiArray, 1)

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

