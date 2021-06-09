ROS.@include std_msgs: Float64MultiArray

callback_enabled = false

function testSubscriber()
    ROS.init("testSub")
    nh = ROS.NodeHandle()

    sub = ROS.subscribe(nh, "test_sub", 1, ROS.std_msgs_Float64MultiArray, callback)

    ROS.getNumPublishers(sub)
    @test ROS.getTopic(sub) == "/test_sub"

    loop = 100
    while loop > 0 && !callback_enabled
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test callback_enabled
    ROS.shutdown(sub)
    ROS.shutdown(nh)
    println("All $(basename(@__FILE__)) tests passed.")
end

function callback(t)
    t.data = [1,2,3,4]
    global callback_enabled = true
end
