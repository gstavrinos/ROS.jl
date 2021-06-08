
@test !isempty(ROS.package.command("list"))
@test !isempty(ROS.package.getAll())
@test !isempty(ROS.package.getPath("std_msgs"))

println("All $(basename(@__FILE__)) tests passed.")
