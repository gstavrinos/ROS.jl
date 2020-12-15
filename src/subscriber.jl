export getNumPublishers, getTopic, shutdown

"""
    getNumPublishers(subscriber)

Returns the number of publishers this subscriber is connected to.
"""
getNumPublishers(subscriber::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N}) = @cxx subscriber->getNumPublishers()

"""
    getTopic(subscriber)

Returns the topic that this Subscriber is subscribed on.
"""
getTopic(subscriber::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N}) = unsafe_string(@cxx subscriber->getTopic())

"""
    shutdown(subscriber)

Unsubscribe the callback associated with this Subscriber. More...
"""
shutdown(subscriber::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Subscriber")},(false, false, false)},N} where N}) = @cxx s->shutdown()
