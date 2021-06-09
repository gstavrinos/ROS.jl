ROS.@include std_srvs: SetBool

srv_callback_enabled = false

function testServiceServer()
    ROS.init("testSS")
    nh = ROS.NodeHandle()

    srv = ROS.advertiseService(nh, "test_srv", ROS.std_srvs_SetBool_Request, ROS.std_srvs_SetBool_Response, srv_callback)

    @test ROS.getService(srv) == "/test_srv"

    loop = 100
    global srv_callback_enabled = false
    while loop > 0 && !srv_callback_enabled
        println("Service server at loop: $loop")
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test srv_callback_enabled

    ROS.shutdown(srv)
    ROS.shutdown(nh)

    println("All $(basename(@__FILE__)) tests passed.")
end

function srv_callback(req,res)
    res.success = true
    res.message = ":D"
    global srv_callback_enabled = true
    return true
end
