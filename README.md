![ROS.jl](docs/src/assets/logo.png)

[![Build Status](https://travis-ci.org/gstavrinos/ROS.jl.svg?branch=master)](https://travis-ci.org/gstavrinos/ROS.jl)
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://gstavrinos.github.io/ROS.jl/stable)

ROS.jl is a Julia wrapper of the ROS C++ client.

### Requirements
* Julia 1.3 (due to current Cxx limitations)

### Installation
```julia
pkg> add ROS
```
or
```julia
using Pkg
Pkg.add("ROS")
```
### Importing the ROS client wrapper
```julia
using ROS
```

### Features
* Automatic/Dynamic Julia msg and srv type generation
* NodeHandles
* Publishers and Subscribers
* Service Servers and Clients
* Action Servers and Clients
* ROS Package
* ROS Time
* TF2

### Naming conventions
* All message and service names replace the C++ namespace symbol `::` with an underscore `_`. Thus for example, `geometry_msgs::PoseStamped` would be translated in Julia to `geometry_msgs_PoseStamped`.
* All generated ROS types have the same name as their contructor without the parentheses `()`. Thus for example, in Julia `geometry_msgs_PoseStamped()` will create a `PoseStamped` object but `geometry_msgs_PoseStamped` holds the C++ type of the `PoseStamped` object. This is useful for templated C++ ROS functions (callbacks etc).

### Examples

All the following examples assume that the `@genNew` or the `@updateAll` macro was called.

```julia
using ROS
ROS.@genNew
```

## Minimum Publisher & Subscriber combination example
```julia
using ROS
ROS.@include std_msgs: Float64MultiArray

pub = nothing

function init()
    ROS.init("julia_pub_sub")
    nh = ROS.NodeHandle()

    global pub = ROS.advertise(nh, "test_pub", ROS.std_msgs_Float64MultiArray, 1)
    sub = ROS.subscribe(nh, "test_sub", 1, ROS.std_msgs_Float64MultiArray, callback)

    while ROS.ok()
        ROS.spinOnce()
    end
end

function callback(t)
    t.data = [1,2,3,4]
    ROS.publish(pub,t)
end

init()
```
Note how both the `advertise` and `subscribe` functions include the type of the message as the third parameter.

## Minimum Service Client & Server combination example
```julia
using ROS
ROS.@include std_srvs: SetBool
ROS.@include roscpp_tutorials: TwoInts 

srvc = nothing

function init()
    ROS.init("test_services")
    nh = ROS.NodeHandle()

    global srvc = ROS.serviceClient(nh, "add_two_ints", ROS.roscpp_tutorials_TwoInts);
    srv = ROS.advertiseService(nh, "test_srv", ROS.std_srvs_SetBool_Request, ROS.std_srvs_SetBool_Response, srv_callback)
    while ROS.ok()
        ROS.spinOnce()
    end
end

function srv_callback(req,res)
    res.success = true
    res.message = ":D"
    st = ROS.roscpp_tutorials_TwoInts()
    st.request.a = 1
    st.request.b = 3
    ROS.call(srvc, st)
    return true
end

init()
```
Note how both the `serviceClient` and `advertiseService` functions include the type of the service as the third parameter (and the fourth parameter in the case of `advertiseService`.

## Minimum Action Client & Server combination example
```julia
using ROS
ROS.@include actionlib_tutorials: FibonacciAction, FibonacciFeedback, FibonacciResult, FibonacciGoal

action_server = nothing

function init()
    ROS.init("test_actions")
    nh = ROS.NodeHandle()

    global action_server = ROS.actionlib.SimpleActionServer("test_action_server", ROS.actionlib_tutorials_FibonacciAction)
    ROS.actionlib.start(action_server)
    ROS.actionlib.registerGoalCallback(action_server, execute_cb)

    action_client = ROS.actionlib.SimpleActionClient("test_action_server", ROS.actionlib_tutorials_FibonacciAction)
    ROS.actionlib.sendGoal(action_client, ROS.actionlib_tutorials_FibonacciGoal())
    ROS.actionlib.waitForResult(action_client, ROS.Duration(3))

    action_result_called = ROS.actionlib.getResult(action_client)

    while ROS.ok()
        state = ROS.actionlib.getState(action_client)
        println(state)
        ROS.spinOnce()
    end

function execute_cb()
    goal = ROS.actionlib.acceptNewGoal(action_server)
    action_feedback = ROS.actionlib_tutorials_FibonacciFeedback()
    f::Vector{Number} = []
    for i in 1:100
        push!(f,i)
        action_feedback.sequence = f
        ROS.actionlib.publishFeedback(action_server, action_feedback)
    end
    action_result = ROS.actionlib_tutorials_FibonacciResult()
    action_result.sequence = f
    ROS.actionlib.setSucceeded(action_server, action_result, ":)")
end

init()
```

## TF example
```julia
using ROS
ROS.@include geometry_msgs: TransformStamped, PoseStamped

function init()
    ROS.init("testTF")
    nh = ROS.NodeHandle()

    b = ROS.tf.TransformBroadcaster()
    sb = ROS.tf.StaticTransformBroadcaster()
    bf = ROS.tf.Buffer()
    tl = ROS.tf.TransformListener(bf)
    ts = ROS.geometry_msgs_TransformStamped()
    ts.header.stamp = ROS.now()
    ts.header.frame_id = "base_link"
    ts.child_frame_id = "gps_link"
    ts.transform.translation.x = 2.3
    ts.transform.translation.y = 1.6
    ts.transform.rotation.w = 1
    ts2 = ROS.geometry_msgs_TransformStamped()
    ts2.header.stamp = ROS.now()
    ts2.header.frame_id = "base_link"
    ts2.child_frame_id = "camera_link"
    ts2.transform.translation.x = 0.3
    ts2.transform.translation.y = 1
    ts2.transform.rotation.w = 1

    ROS.tf.sendTransform(b, ts)

    # Send multiple TFs at once
    tss = [ts,ts2]
    ROS.tf.sendTransform(sb, tss)

    if ROS.tf.canTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
        stamped = ROS.tf.lookupTransform(bf, "base_link", "camera_link", ROS.Time(0), ROS.Duration(1))
        println(stamped.transform.translation.x)
        println(stamped.header.frame_id)

        p = ROS.geometry_msgs_PoseStamped()
        p.header.frame_id = "camera_link"
        p.pose.position.x = 1
        p.pose.position.y = 0.6
        p.pose.orientation.w = 1
        try
            transformed = ROS.tf.transform(bf, p, "base_link", ROS.Time(0), "gps_link", ROS.Duration(1))
            println(transformed.pose.position.x)
        catch
            println("TF Exception :(")
        end
    end
end

init()
```
Note the multiple included types using the `@include` macro.

