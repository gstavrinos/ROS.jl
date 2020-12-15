export NodeHandle, advertise, advertiseService, subscribe, shutdown, serviceClient, hasParam, deleteParam, setParam, param

# -------------------------------------------------------------------
# Hacky helpers, not intended to be accessed by users
# (Ensuring safety from gc)
# -------------------------------------------------------------------
__subs = []
__srvs = []

# -------------------------------------------------------------------
# roscpp functions
# -------------------------------------------------------------------

# TODO support TransportHints in subscribe function

"""
    NodeHandle()

Create a NodeHandle.
"""
NodeHandle() = @cxxnew ros::NodeHandle()

"""
    advertise(nodehandle, topic_name::String, topic_type, queue_size::Int)

Advertise a topic.
"""
advertise(nodehandle, topic_name::String, topic_type, queue_size::Int) = icxx"$(nodehandle)->advertise<$(topic_type)>($(pointer(topic_name)), $(queue_size));"

"""
    serviceClient(nodehandle, topic_name::String, topic_type)

Create a client for a service.
"""
serviceClient(nodehandle, topic_name::String, topic_type) = icxx"$(nodehandle)->serviceClient<$topic_type>($(pointer(topic_name)));"

"""
    advertiseService(nodehandle, service_name::String, service_request_type, service_response_type, callback)

Advertise a service.
"""
function advertiseService(nodehandle, service_name::String, service_request_type, service_response_type, callback)
    push!(__srvs,
        icxx"""
        boost::function<bool ($(service_request_type)&, $(service_response_type)&)> cpp_srv_callback = [&]($(service_request_type) &req, $(service_response_type) &res) {
            return $:(callback(icxx"return &req;", icxx"return &res;")::Bool);
        };
        return $(nodehandle)->advertiseService($(pointer(service_name)), cpp_srv_callback);
        """)
    return last(__srvs)
end

"""
    subscribe(nodehandle, topic_name::String, queue_size::Int, topic_type, callback)

Subscribe to a topic.
"""
function subscribe(nodehandle, topic_name::String, queue_size::Int, topic_type, callback)
    push!(__subs,
        icxx"""
        boost::function<void ($(topic_type))> cpp_callback = [&]($(topic_type) msg) {
            $:(callback(icxx"return &msg;");nothing);
        };
        return $(nodehandle)->subscribe<$(topic_type)>($(pointer(topic_name)), $(queue_size), cpp_callback);
        """)
    return last(__subs)
end

"""
    hasParam(n, key::String)

Check whether a parameter exists on the parameter server.
"""
hasParam(n, key::String) = @cxx n->hasParam(pointer(key))

"""
    deleteParam(n, key::String)

Delete a parameter from the parameter server.
"""
deleteParam(n, key::String) = @cxx n->deleteParam(pointer(key))

"""
    setParam(n, key::String, value::Int32)

Set a value ont the parameter server.
"""
setParam(n, key::String, value::Int32) = @cxx n->setParam(pointer(key), value)

# The cast below will introduce bugs in VERY large numbers.
"""
    setParam(n, key::String, value::Int64)

Set a value ont the parameter server.
"""
setParam(n, key::String, value::Int64) = @cxx n->setParam(pointer(key), Int32(value))

"""
    setParam(n, key::String, value::Float64)

Set a value ont the parameter server.
"""
setParam(n, key::String, value::Float64) = @cxx n->setParam(pointer(key), value)

"""
    setParam(n, key::String, value::Bool)

Set a value ont the parameter server.
"""
setParam(n, key::String, value::Bool) = @cxx n->setParam(pointer(key), value)

"""
    setParam(n, key::String, value::String)

Set a value ont the parameter server.
"""
setParam(n, key::String, value::String) = @cxx n->setParam(pointer(key), pointer(value))

"""
    param(n, key::String, default::Int32)

Assign value from parameter server, with default.
"""
param(n, key::String, default::Int32) = @cxx n->param(pointer(key), default)

# The cast below will introduce bugs in VERY large numbers.
"""
    param(n, key::String, default::Int64)

Assign value from parameter server, with default.
"""
param(n, key::String, default::Int64) = @cxx n->param(pointer(key), Int32(default))

"""
    param(n, key::String, default::Float64)

Assign value from parameter server, with default.
"""
param(n, key::String, default::Float64) = @cxx n->param(pointer(key), default)

"""
    param(n, key::String, default::Bool)

Assign value from parameter server, with default.
"""
param(n, key::String, default::Bool) = @cxx n->param(pointer(key), default)

"""
    param(n, key::String, default::String)

Assign value from parameter server, with default.
"""
param(n, key::String, default::String) = unsafe_string(icxx"return $(n)->param($(pointer(key)), std::string($(default)));")

"""
    shutdown(n)

Shutdown every handle created through `this` NodeHandle.
"""
shutdown(n::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::NodeHandle")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::NodeHandle")},(false, false, false)},N} where N}) = @cxx n->shutdown()


