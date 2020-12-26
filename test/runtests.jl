ENV["JULIA_CXX_RTTI"]=1
using Cxx
using Test
include("../src/ROS.jl")
#  using ROS

ROS.@genNew
ROS.@updateAll

include("publisher.jl")
include("subscriber.jl")
include("serviceServer.jl")
include("serviceClient.jl")
include("actionlib_client.jl")
include("actionlib_server.jl")

as = Threads.@spawn testActionServer()
ac = Threads.@spawn testActionClient()
wait(ac)
wait(as)
s = Threads.@spawn testSubscriber()
p = Threads.@spawn testPublisher()
wait(p)
wait(s)
sc = Threads.@spawn testServiceClient()
ss = Threads.@spawn testServiceServer()
wait(sc)
wait(ss)

include("tf.jl")
include("time.jl")
include("roscpp.jl")
include("package.jl")
include("nodehandle.jl")
