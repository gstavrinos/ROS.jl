module actionlib
using Cxx

__action_srvs = []

# Server

"""
    SimpleActionServer(name::String, action_spec)

Constructor for a SimpleActionServer.
"""
function SimpleActionServer(name::String, action_spec)
    push!(__action_srvs, icxx"""
        return new actionlib::SimpleActionServer<$(action_spec)>($(pointer(name)), false);
    """)
    return last(__action_srvs)
end

"""
    SimpleActionServer(name::String, action_spec, auto_start::Bool)

Constructor for a SimpleActionServer.
"""
function SimpleActionServer(name::String, action_spec, auto_start::Bool)
    push!(__action_srvs, icxx"""
        return new actionlib::SimpleActionServer<$(action_spec)>($(pointer(name)), $(auto_start));
    """)
    return last(__action_srvs)
end

"""
   registerGoalCallback(action_server, callback)

Allows users to register a callback to be invoked when a new goal is available.
"""
function registerGoalCallback(action_server::Cxx.CxxCore.CppPtr, callback)
    icxx"""
        boost::function<void ()> cpp_execute_cb = [&]() {
            $:(callback()::Nothing;nothing);
        };
        $action_server->registerGoalCallback(cpp_execute_cb);
    """
end

"""
    registerPreemptCallback(action_server, callback)

Allows users to register a callback to be invoked when a new preempt request is available.
"""
function registerPreemptCallback(action_server::Cxx.CxxCore.CppPtr, callback)
    icxx"""
        boost::function<void ()> cpp_execute_cb = [&]() {
            $:(callback()::Nothing;nothing);
        };
        $action_server->registerPreemptCallback(cpp_execute_cb);
    """
end

"""
    acceptNewGoal(action_server)

Accepts a new goal when one is available. The status of this goal is set to active upon acceptance, and the status of any previously active goal is set to preempted. Preempts received for the new goal between checking if isNewGoalAvailable or invocation of a goal callback and the acceptNewGoal call will not trigger a preempt callback. This means, isPreemptRequested should be called after accepting the goal even for callback-based implementations to make sure the new goal does not have a pending preempt request.
"""
acceptNewGoal(action_server::Cxx.CxxCore.CppPtr) = icxx" return &*$action_server->acceptNewGoal();"

"""
    start(action_server)

Explicitly start the action server, used it auto_start is set to false.
"""
start(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->start()

"""
    isActive(action_server)

Allows polling implementations to query about the status of the current goal.
"""
isActive(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->isActive()

"""
    isNewGoalRequested(action_server)

Allows polling implementations to query about the availability of a new goal.
"""
isNewGoalRequested(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->isNewGoalRequested()

"""
    isPreemptRequested(action_server)

Allows polling implementations to query about preempt requests.
"""
isPreemptRequested(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->isPreemptRequested()

"""
    shutdown(action_server)

Explicitly shutdown the action server.
"""
shutdown(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->shutdown()

"""
    setAborted(action_server)

Sets the status of the active goal to aborted.
"""
setAborted(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->setAborted()

"""
    setAborted(action_server, result, text::String)

Sets the status of the active goal to aborted.
"""
setAborted(action_server::Cxx.CxxCore.CppPtr, result::Cxx.CxxCore.CppPtr, text::String) = icxx"$action_server->setAborted(*$result, $(pointer(text)));"

"""
    setPreempted(action_server)

Sets the status of the active goal to preempted.
"""
setPreempted(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->setPreempted()

"""
    setPreempted(action_server, result, text::String)

Sets the status of the active goal to preempted.
"""
setPreempted(action_server::Cxx.CxxCore.CppPtr, result::Cxx.CxxCore.CppPtr, text::String) = icxx"$action_server->setPreempted(*$result, $(pointer(text)));"

"""
    setSucceeded(action_server)

Sets the status of the active goal to succeeded.
"""
setSucceeded(action_server::Cxx.CxxCore.CppPtr) = @cxx action_server->setSucceeded()

"""
    setSucceeded(action_server, result, text::String)

Sets the status of the active goal to succeeded.
"""
setSucceeded(action_server::Cxx.CxxCore.CppPtr, result::Cxx.CxxCore.CppPtr, text::String) = icxx"$action_server->setSucceeded(*$result, $(pointer(text)));"

"""
    publishFeedback(action_server, feedback)

Publishes feedback for a given goal.
"""
publishFeedback(action_server::Cxx.CxxCore.CppPtr, feedback::Cxx.CxxCore.CppPtr) = icxx"$action_server->publishFeedback(*$feedback);"

# Client

"""
    SimpleActionClient(name::String, action_spec, spin::Bool)

Simple constructor.
"""
function SimpleActionClient(name::String, action_spec, spin::Bool)
    icxx"""
        return new actionlib::SimpleActionClient<$(action_spec)>($(pointer(name)), $spin);
    """
end

"""
    SimpleActionClient(name::String, action_spec)

Simple constructor.
"""
function SimpleActionClient(name::String, action_spec)
    icxx"""
        return new actionlib::SimpleActionClient<$(action_spec)>($(pointer(name)));
    """
end

"""
    cancelAllGoals(action_client)

Cancel all goals currently running on the action server.
"""
cancelAllGoals(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->cancelAllGoals()

"""
    cancelGoal(action_client)

Cancel the goal that we are currently pursuing.
"""
cancelGoal(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->cancelGoal()

"""
    isServerConnected(action_client)

Checks if the action client is successfully connected to the action server.
"""
isServerConnected(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->isServerConnected()

"""
    stopTrackingGoal(action_client)

Stops tracking the state of the current goal. Unregisters this goal's callbacks.
"""
stopTrackingGoal(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->stopTrackingGoal()

"""
    waitForResult(action_client)

Blocks until this goal finishes.
"""
waitForResult(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->waitForResult()

"""
    waitForResult(action_client, timeout)

Blocks until this goal finishes.
"""
waitForResult(action_client::Cxx.CxxCore.CppPtr, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx action_client->waitForResult(*(timeout))

waitForResult(action_result::Cxx.CxxCore.CppPtr, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}) = @cxx action_client->waitForResult(timeout)

"""
    waitForServer(action_client)

Waits for the ActionServer to connect to this client.
"""
waitForServer(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->waitForServer()

"""
    waitForServer(action_client, timeout)

Waits for the ActionServer to connect to this client.
"""
waitForServer(action_client::Cxx.CxxCore.CppPtr, timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxx action_client->waitForServer(*(timeout))

waitForServer(action_result::Cxx.CxxCore.CppPtr, timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}) = @cxx action_client->waitForServer(timeout)

"""
    sendGoal(action_client, goal)

Sends a goal to the ActionServer, and also registers callbacks.
"""
sendGoal(action_client::Cxx.CxxCore.CppPtr, goal::Cxx.CxxCore.CppPtr) = icxx"$action_client->sendGoal(*$goal);"

"""
    sendGoalAndWait(action_client, goal, ex_timeout, pr_timeout)

Sends a goal to the ActionServer, and waits until the goal completes or a timeout is exceeded.
"""
sendGoalAndWait(action_client::Cxx.CxxCore.CppPtr, goal::Cxx.CxxCore.CppPtr, ex_timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}, pr_timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}) = icxx"$action_client->sendGoalAndWait(*$goal, $ex_timeout, $pr_timeout);"

"""
    sendGoalAndWait(action_client, goal, pr_timeout)

Sends a goal to the ActionServer, and waits until the goal completes or a timeout is exceeded.
"""
sendGoalAndWait(action_client::Cxx.CxxCore.CppPtr, goal::Cxx.CxxCore.CppPtr, ex_timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, pr_timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"$action_client->sendGoalAndWait(*$goal, *$ex_timeout, *$pr_timeout);"

sendGoalAndWait(action_client::Cxx.CxxCore.CppPtr, goal::Cxx.CxxCore.CppPtr, ex_timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}, pr_timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = icxx"$action_client->sendGoalAndWait(*$goal, $ex_timeout, *$pr_timeout);"

sendGoalAndWait(action_client::Cxx.CxxCore.CppPtr, goal::Cxx.CxxCore.CppPtr, ex_timeout::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, pr_timeout::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N where N}) = icxx"$action_client->sendGoalAndWait(*$goal, *$ex_timeout, $pr_timeout);"

# TODO this returns a bad_alloc quite frequently...
"""
    getResult(action_client)

Get the Result of the current goal.
"""
getResult(action_client::Cxx.CxxCore.CppPtr) = icxx"return &*$action_client->getResult();"

"""
    getState(action_client)

Get the state information for this goal.
"""
getState(action_client::Cxx.CxxCore.CppPtr) = @cxx action_client->getState()

"""
    getText(state)

Returns the text field of the state.
"""
getText(state::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("actionlib::SimpleClientGoalState")},(false, false, false)},N }where N) = unsafe_string(@cxx state->getText())

"""
    isDone(state)

Determine if goal is done executing (ie. reached a terminal state).
"""
isDone(state::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("actionlib::SimpleClientGoalState")},(false, false, false)},N }where N) = @cxx state->isDone()

"""
    toString(state)

Convert the state to a string. Useful when printing debugging information.
"""
toString(state::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("actionlib::SimpleClientGoalState")},(false, false, false)},N }where N) = unsafe_string(@cxx state->toString())

end
