
ROS.init("testNodeHandle")
nh = ROS.NodeHandle()

@test ROS.param(nh, "float_param", 16.7) == 16.7
@test ROS.param(nh, "int_param", Int32(16)) == 16
@test ROS.param(nh, "int_param", 16) == 16
@test ROS.param(nh, "string_param", "s") == "s"
@test ROS.param(nh, "bool_param", true)
@test !ROS.hasParam(nh, "float_param")
@test !ROS.hasParam(nh, "int_param")
@test !ROS.hasParam(nh, "string_param")
@test !ROS.hasParam(nh, "bool_param")
ROS.setParam(nh, "float_param", 16.7)
ROS.setParam(nh, "int_param", Int32(16))
ROS.setParam(nh, "int_param", 16)
ROS.setParam(nh, "string_param", "s")
ROS.setParam(nh, "bool_param", true)
@test ROS.hasParam(nh, "float_param")
@test ROS.hasParam(nh, "int_param")
@test ROS.hasParam(nh, "string_param")
@test ROS.hasParam(nh, "bool_param")

ROS.deleteParam(nh, "float_param")
ROS.deleteParam(nh, "int_param")
ROS.deleteParam(nh, "string_param")
ROS.deleteParam(nh, "bool_param")

@test !ROS.hasParam(nh, "float_param")
@test !ROS.hasParam(nh, "int_param")
@test !ROS.hasParam(nh, "string_param")
@test !ROS.hasParam(nh, "bool_param")

ROS.shutdown(nh)

println("All $(basename(@__FILE__)) tests passed.")
