ROS.@include std_srvs: SetBool

called_success = false

function testServiceClient()
    ROS.init("testSC")
    nh = ROS.NodeHandle()

    srvc = ROS.serviceClient(nh, "test_srv", ROS.std_srvs_SetBool)

    @test ROS.getService(srvc) == "/test_srv"
    @test ROS.isValid(srvc)

    loop = 500
    global called_success
    srv = ROS.std_srvs_SetBool()
    while loop > 0 && !Bool(srv.response.success)
        println("Service client at loop: $loop")
        if ROS.exists(srvc)
            ROS.call(srvc, srv) 
            called_success = true
        end
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test called_success
    @test !ROS.isPersistent(srvc)

    println("All $(basename(@__FILE__)) tests passed.")
end

