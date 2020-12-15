export getNumSubscribers, getTopic, publish, shutdown

"""
    getNumSubscribers(publisher)

Returns the number of subscribers that are currently connected to this Publisher. 
"""
getNumSubscribers(publisher::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}) = @cxx publisher->getNumSubscribers()

"""
    getTopic(publisher)

Returns the topic that this Publisher will publish on. 
"""
getTopic(publisher::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}) = unsafe_string(@cxx publisher->getTopic())

"""
    isLatched(publisher)

Returns whether or not this topic is latched.
"""
isLatched(publisher::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}) = @cxx publisher->isLatched()

"""
    publish(publisher, msg)

Publish a message on the topic associated with this Publisher.
"""
publish(publisher::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}, msg::Cxx.CxxCore.CppValue) = @cxx publisher->publish(msg)

publish(publisher::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}, msg::Cxx.CxxCore.CppPtr) = @cxx publisher->publish(*(msg))

"""
    shutdown(publisher)

Shutdown the advertisement associated with this Publisher.
"""
shutdown(p::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Publisher")},(false, false, false)},N} where N}) = @cxx p->shutdown()

