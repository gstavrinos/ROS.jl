export getService, shutdown

"""
    getService(server)

Returns the service that this ServiceServer will advertise on.
"""
getService(s::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceServer")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceServer")},(false, false, false)},N} where N}) = unsafe_string(@cxx s->getService())

"""
    shutdown(server)

Unadvertise the service associated with this ServiceServer.
"""
shutdown(s::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceServer")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceServer")},(false, false, false)},N} where N}) = @cxx s->shutdown()
