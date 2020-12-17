ENV["JULIA_CXX_RTTI"]=1
using Cxx
push!(LOAD_PATH,"../src/")
using Documenter, ROS

makedocs(
    modules = [ROS],
    authors = "George Stavrinos",
    sitename = "ROS.jl",
    format = Documenter.HTML(prettyurls = false, footer = nothing),
    pages = [
        "Home" => "index.md",
        "Features" => "features.md",
        "Examples" => "examples.md",
        "API" => [
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
        ],
    ]
)

deploydocs(
    repo = "github.com/gstavrinos/ROS.jl.git"
)

