using ROS
ROS.@include std_srvs: SetBool
ROS.@include roscpp_tutorials: TwoInts 

srvc = nothing

function init()
    ROS.init("test_services")
    nh = ROS.NodeHandle()

    global srvc = ROS.serviceClient(nh, "add_two_ints", ROS.roscpp_tutorials_TwoInts);
    srv = ROS.advertiseService(nh, "test_srv", ROS.std_srvs_SetBool_Request, ROS.std_srvs_SetBool_Response, srv_callback)
    while ROS.ok()
        ROS.spinOnce()
    end
end

function srv_callback(req,res)
    res.success = true
    res.message = ":D"
    st = ROS.roscpp_tutorials_TwoInts()
    st.request.a = 1
    st.request.b = 3
    ROS.call(srvc, st)
    return true
end

init()
