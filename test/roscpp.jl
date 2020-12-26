
ROS.init("testBase")
nh = ROS.NodeHandle()

@test ROS.ok()
ROS.spinOnce()
ROS.info("j")
ROS.info_stream(3.2)
ROS.warn("u")
ROS.warn_stream(2)
ROS.error("l")
ROS.error_stream(16.07)
ROS.fatal("i")
ROS.fatal_stream(true)
ROS.debug("a")
ROS.debug_stream("!")

println("All $(basename(@__FILE__)) tests passed.")
