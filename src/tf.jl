module tf
using Cxx

__tf_buffers = []
__tf_listeners = []

"""
    TransformBroadcaster()

Constructor (needs a ros::Node reference).
"""
TransformBroadcaster() = icxx"return new tf2_ros::TransformBroadcaster();"

"""
    StaticTransformBroadcaster()

Constructor (needs a ros::Node reference).
"""
StaticTransformBroadcaster() = icxx"return new tf2_ros::StaticTransformBroadcaster();"

"""
    sendTransform(broadcaster, transform)

Send a TransformStamped message The stamped data structure includes frame_id, and time, and parent_id already.
"""
sendTransform(broadcaster::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::TransformBroadcaster")},(false, false, false)},(false, false, false)}, transform::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}) = @cxx broadcaster->sendTransform(*(transform))

"""
    function sendTransform(broadcaster, transforms::Union{Array,Vector})

Send a TransformStamped message The stamped data structure includes frame_id, and time, and parent_id already.
"""
function sendTransform(broadcaster::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::TransformBroadcaster")},(false, false, false)},(false, false, false)}, transforms::Union{Array,Vector})
    for transform in transforms
        sendTransform(broadcaster, transform)
    end
end

"""
    sendTransform(static_broadcaster, transform)

Send a TransformStamped message The stamped data structure includes frame_id, and time, and parent_id already.
"""
sendTransform(broadcaster::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::StaticTransformBroadcaster")},(false, false, false)},(false, false, false)}, transform::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::TransformStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}) = @cxx broadcaster->sendTransform(*(transform))

"""
    sendTransform(static_broadcaster, transforms::Union{Array,Vector})

Send a TransformStamped message The stamped data structure includes frame_id, and time, and parent_id already.
"""
function sendTransform(broadcaster::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::StaticTransformBroadcaster")},(false, false, false)},(false, false, false)}, transforms::Union{Array,Vector})
    for transform in transforms
        sendTransform(broadcaster, transform)
    end
end

"""
    Buffer()

Constructor for a Buffer object.
"""
function Buffer()
    push!(__tf_buffers, icxx"return new tf2_ros::Buffer();")
    return last(__tf_buffers)
end

"""
    TransformListener(buffer)

Constructor for transform listener.
"""
function TransformListener(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)})
    push!(__tf_listeners, icxx"return new tf2_ros::TransformListener(*$buffer);")
    return last(__tf_listeners)
end

"""
    canTransform(buffer, target_frame::String, source_frame::String, time, timeout)

Test if a transform is possible.
"""
canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), pointer(source_frame), *(time), *(timeout))

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), pointer(source_frame), time, *(timeout))

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), pointer(source_frame), *(time), timeout)

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), pointer(source_frame), time, timeout)

"""
    canTransform(buffer, target_frame::String, target_time, source_frame::String, source_time, fixed_frame::String, timeout)

Test if a transform is possible.
"""
canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), *(target_time), pointer(source_frame), *(source_time), pointer(fixed_frame), *(timeout))

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), target_time, pointer(source_frame), *(source_time), pointer(fixed_frame), *(timeout))

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), target_time, pointer(source_frame), source_time, pointer(fixed_frame), *(timeout))

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), target_time, pointer(source_frame), source_time, pointer(fixed_frame), timeout)

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), target_time, pointer(source_frame), *(source_time), pointer(fixed_frame), timeout)

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), *(target_time), pointer(source_frame), *(source_time), pointer(fixed_frame), timeout)

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = @cxx buffer->canTransform(pointer(target_frame), *(target_time), pointer(source_frame), source_time, pointer(fixed_frame), timeout)

canTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx buffer->canTransform(pointer(target_frame), *(target_time), pointer(source_frame), source_time, pointer(fixed_frame), *(timeout))

"""
    lookupTransform(buffer, target_frame::String, source_frame::String, time, timeout)

Get the transform between two frames by frame ID.
"""
lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $(pointer(source_frame)), *($time), *($timeout)));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $(pointer(source_frame)), $time, *($timeout)));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $(pointer(source_frame)), *($time), $timeout));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, source_frame::String, time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $(pointer(source_frame)), $time, $timeout));"

"""
    lookupTransform(buffer, target_frame::String, target_time, source_frame::String, source_time, fixed_frame::String, timeout)

Get the transform between two frames by frame ID assuming fixed frame.
"""
lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), *($target_time), $(pointer(source_frame)), *($source_time), $(pointer(fixed_frame)), *($timeout)));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $target_time, $(pointer(source_frame)), *($source_time), $(pointer(fixed_frame)), *($timeout)));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $target_time, $(pointer(source_frame)), $source_time, $(pointer(fixed_frame)), *($timeout)));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $target_time, $(pointer(source_frame)), $source_time, $(pointer(fixed_frame)), $timeout));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), $target_time, $(pointer(source_frame)), *($source_time), $(pointer(fixed_frame)), $timeout));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), *($target_time), $(pointer(source_frame)), *($source_time), $(pointer(fixed_frame)), $timeout));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), *($target_time), $(pointer(source_frame)), $source_time, $(pointer(fixed_frame)), $timeout));"

lookupTransform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, target_frame::String, target_time::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, source_frame::String, source_time::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, fixed_frame::String, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"return new geometry_msgs::TransformStamped($buffer->lookupTransform($(pointer(target_frame)), *($target_time), $(pointer(source_frame)), $source_time, $(pointer(fixed_frame)), *($timeout)));"

"""
    transform(buffer, in, target_frame::String, timeout)

Transform an input into the target frame.
"""
function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), $timeout));"
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), $timeout));"
        end
    end
end

"""
    transform(buffer, in, target_frame::String, target_time, fixed_frame::String, timeout)

Transform an input into the target frame.
"""
function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PoseStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, target_time::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}, fixed_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::PoseStamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::PoseStamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    end
end

function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), $timeout));"
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), $timeout));"
        end
    end
end

function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::PointStamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, target_time::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}, fixed_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::PointStamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::PointStamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    end
end

function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), $timeout));"
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), *($timeout)));"
        else
            icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), $timeout));"
        end
    end
end

function transform(buffer::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("tf2_ros::Buffer")},(false, false, false)},(false, false, false)}, in::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Vector3Stamped_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(true, false, false)},(false, false, false)}}, target_frame::String, target_time::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}, fixed_frame::String, timeout::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N})
    if typeof(in) <: Cxx.CxxCore.CppPtr
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform(*($in), $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    else
        if typeof(timeout) <: Cxx.CxxCore.CppPtr
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), *($timeout)));"
            else
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), *($timeout)));"
            end
        else
            if typeof(target_time) <: Cxx.CxxCore.CppPtr
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), *($target_time), $(pointer(fixed_frame)), $timeout));"
            else
                icxx"return new geometry_msgs::Vector3Stamped($buffer->transform($in, $(pointer(target_frame)), $target_time, $(pointer(fixed_frame)), $timeout));"
            end
        end
    end
end

"""
    setRPY(roll::Number, pitch::Number, yaw::Number)

Euler angles (roll/pitch/yaw) to geometry_msgs::Quaternion.
"""
function setRPY(roll::Number, pitch::Number, yaw::Number)
    icxx"""
        tf2::Quaternion tf_quat;
        tf_quat.setRPY($roll, $pitch, $yaw);
        return new geometry_msgs::Quaternion(tf2::toMsg(tf_quat));
    """
end

"""
    normalize(quaternion)

Normalize a geometry_msgs::Quaternion (useful after calculations).
"""
function normalize(quaternion)
    icxx"""
        tf2::Quaternion tf_quat;
        tf2::fromMsg(*$quaternion, tf_quat);
        tf_quat.normalize();
        return new geometry_msgs::Quaternion(tf2::toMsg(tf_quat));
    """
end

function Base.:*(q1::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}}, q2::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}, Cxx.CxxCore.CppPtr{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("geometry_msgs::Quaternion_")},Tuple{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppTemplate{Cxx.CxxCore.CppBaseType{Symbol("std::allocator")},Tuple{Nothing}},(false, false, false)}}},(false, false, false)},(false, false, false)}})
    icxx"""
        tf2::Quaternion q1, q2;
        tf2::fromMsg(*$q1, q1);
        tf2::fromMsg(*$q2, q2);
        return new geometry_msgs::Quaternion(tf2::toMsg(q1*q2));
    """
end

end
