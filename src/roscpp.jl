export init, ok, spin, spinOnce, now
export info, info_stream, warn, warn_stream, error, error_stream, debug, debug_stream, fatal, fatal_stream

"""
    now()

Retrieve the current time. If ROS clock time is in use, this returns the time according to the ROS clock. Otherwise returns the current wall clock time.
"""
now() = @cxx ros::Time::now()

"""
    spin()

Enter simple event loop.
"""
spin() = @cxx ros::spin()

"""
    spinOnce()

Process a single round of callbacks.
"""
spinOnce() = @cxx ros::spinOnce()

"""
    ok()

Check whether it's time to exit.
"""
ok() = @cxx ros::ok()

"""
    init(node_name::String)

ROS initialization function.
"""
init(node_name::String) = @cxx ros::init(Int32(length(ARGS)+1), pointer(pointer.(pushfirst!(ARGS,PROGRAM_FILE))), pointer(node_name))

"""
    info(n)

Print `n` with a ROS info logging level.
"""
info(n) = icxx"ROS_INFO_STREAM($n);"

"""
    info_stream(n)

Print `n` with a ROS info logging level.
"""
info_stream(n) = info(n)

"""
    warn(n)

Print `n` with a ROS warn logging level.
"""
warn(n) = icxx"ROS_WARN_STREAM($n);"

"""
    warn_stream(n)

Print `n` with a ROS warn logging level.
"""
warn_stream(n) = warn(n)

"""
    error(n)

Print `n` with a ROS error logging level.
"""
error(n) = icxx"ROS_ERROR_STREAM($n);"

"""
    error_stream(n)

Print `n` with a ROS error logging level.
"""
error_stream(n) = error(n)

"""
    debug(n)

Print `n` with a ROS debug logging level.
"""
debug(n) = icxx"ROS_DEBUG_STREAM($n);"

"""
    debug_stream(n)

Print `n` with a ROS debug logging level.
"""
debug_stream(n) = debug(n)

"""
    fatal(n)

Print `n` with a ROS fatal logging level.
"""
fatal(n) = icxx"ROS_FATAL_STREAM($n);"

"""
    fatal_stream(n)

Print `n` with a ROS fatal logging level.
"""
fatal_stream(n) = fatal(n)

function ros♥julia()
    try
        ros_root = normpath(joinpath(ENV["ROS_ROOT"], "../.."))
        ros_header_dir = ros_root * "include"
        ros_lib_dir = ros_root * "lib"
        addHeaderDir(ros_header_dir, kind = C_System)
        package_path = String.(split(ENV["ROS_PACKAGE_PATH"], ":"))
        for path in package_path
            path = normpath(path, "..")
            if path != ros_root
                addHeaderDir(joinpath(path, "devel", "include"), kind = C_System)
            end
        end
        # Base ROS
        cxxinclude(joinpath(ros_header_dir,"ros","ros.h"))
        cxxinclude(joinpath(ros_header_dir,"ros","package.h"))
        Libdl.dlopen(joinpath(ros_lib_dir, "libroscpp.so"), Libdl.RTLD_GLOBAL)
        Libdl.dlopen(joinpath(ros_lib_dir, "libroslib.so"), Libdl.RTLD_GLOBAL)
        # Actionlib
        cxxinclude(joinpath(ros_header_dir,"actionlib","server","simple_action_server.h"))
        cxxinclude(joinpath(ros_header_dir,"actionlib","client","simple_action_client.h"))
        cxxinclude(joinpath(ros_header_dir,"actionlib","client","simple_client_goal_state.h"))
        cxxinclude(joinpath(ros_header_dir,"actionlib","client","terminal_state.h"))
        Libdl.dlopen(joinpath(ros_lib_dir, "libactionlib.so"), Libdl.RTLD_GLOBAL)
        # tf
        cxxinclude(joinpath(ros_header_dir,"tf2_ros","transform_broadcaster.h"))
        cxxinclude(joinpath(ros_header_dir,"tf2_ros","static_transform_broadcaster.h"))
        cxxinclude(joinpath(ros_header_dir,"tf2_ros","transform_listener.h"))
        cxxinclude(joinpath(ros_header_dir,"tf2_geometry_msgs","tf2_geometry_msgs.h"))
        cxxinclude(joinpath(ros_header_dir, "tf2", "LinearMath", "Quaternion.h"))
        Libdl.dlopen(joinpath(ros_lib_dir, "libtf2.so"), Libdl.RTLD_GLOBAL)
        Libdl.dlopen(joinpath(ros_lib_dir, "libtf2_ros.so"), Libdl.RTLD_GLOBAL)
        #  println(pushfirst!(ARGS,PROGRAM_FILE))
    catch
        throw(ErrorException("ROS.jl cannot find your ROS installation! ¯\\_(ツ)_/¯"))
    end
end
