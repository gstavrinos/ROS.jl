using ROS
ROS.@include std_msgs: Float64MultiArray

pub = nothing

function init()
    ROS.init("julia_pub_sub")
    nh = ROS.NodeHandle()

    global pub = ROS.advertise(nh, "test_pub", ROS.std_msgs_Float64MultiArray, 1)
    sub = ROS.subscribe(nh, "test_sub", 1, ROS.std_msgs_Float64MultiArray, callback)

    while ROS.ok()
        ROS.spinOnce()
    end
end

function callback(t)
    t.data = [1,2,3,4]
    ROS.publish(pub,t)
end

init()
