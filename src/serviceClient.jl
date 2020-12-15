export call, exists, getService, isValid

"""
    call(serviceClient, srv)

Call the service aliased by this handle with the specified service request/response.
"""
call(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}, srv::Cxx.CxxCore.CppValue) = @cxx serviceClient->call(srv)

call(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}, srv::Cxx.CxxCore.CppPtr) = @cxx serviceClient->call(*(srv))

"""
    exists(serviceClient)

Checks if this is both advertised and available.
"""
exists(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}) = @cxx serviceClient->exists()

"""
    getService(serviceClient)

Returns the name of the service this ServiceClient connects to.
"""
getService(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}) = unsafe_string(@cxx serviceClient->getService())

"""
    isPersistent(serviceClient)

Returns true if this handle points to a persistent service, false otherwise.
"""
isPersistent(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}) = @cxx serviceClient->isPersistent()

"""
    isValid(serviceClient)

Returns whether or not this handle is valid. For a persistent service, this becomes false when the connection has dropped. Non-persistent service handles are always valid.
"""
isValid(serviceClient::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::ServiceClient")},(false, false, false)},N} where N}) = @cxx serviceClient->isValid()
