ROS.@include std_srvs: SetBool


function testServiceClient()
    ROS.init("testSC")
    nh = ROS.NodeHandle()

    srvc = ROS.serviceClient(nh, "test_srv", ROS.std_srvs_SetBool)

    @test ROS.getService(srvc) == "/test_srv"
    @test ROS.isValid(srvc)

    loop = 500
    while loop > 0
        if ROS.exists(srvc)
            ROS.call(srvc, ROS.std_srvs_SetBool())
            break
        end
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test loop > 0
    @test !ROS.isPersistent(srvc)

    println("All $(basename(@__FILE__)) tests passed.")
end

