ROS.@include std_srvs: SetBool

function testServiceClient()
    ROS.init("testSC")
    nh = ROS.NodeHandle()

    srvc = ROS.serviceClient(nh, "test_srv", ROS.std_srvs_SetBool)

    @test ROS.getService(srvc) == "/test_srv"
    @test ROS.isValid(srvc)

    loop = 100
    called_success = false
    srv = ROS.std_srvs_SetBool()
    while loop > 0 && !called_success
        println("Service client at loop: $loop")
        if ROS.exists(srvc)
            called_success = ROS.call(srvc, srv)
        end
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test called_success 
    @test !ROS.isPersistent(srvc)

    ROS.shutdown(nh)

    println("All $(basename(@__FILE__)) tests passed.")
end

