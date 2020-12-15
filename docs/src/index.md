![ROS.jl](assets/logo.png)

```@meta
CurrentModule = ROS
```

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

### API

```@contents
Pages = [
    "roscpp.md", 
    "nodehandle.md",
    "subscriber.md",
    "publisher.md",
    "serviceServer.md",
    "serviceClient.md",
    "time.md",
    "package.md",
    "actionlib.md",
    "tf.md",
    "typegen.md"
]
```









