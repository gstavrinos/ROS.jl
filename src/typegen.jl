#!/usr/bin/env julia
export @include, @genNew, @updateAll

primitive_types = Dict(
    "bool"      => "Bool",
    "int8"      => "Int8",
    "byte"      => "Int8",
    "uint8"     => "UInt8",
    "char"      => "UInt8",
    "int16"     => "Int16",
    "uint16"    => "UInt16",
    "int32"     => "Number",
    "uint32"    => "Unsigned",
    "int64"     => "Number",
    "uint64"    => "Unsigned",
    "float32"   => "Number",
    "float64"   => "Number",
    "string"    => "String",
    "bool[]"    => "Union{Vector{Bool}, Array{Bool}}",
    "int8[]"    => "Union{Vector{Int8}, Array{Int8}}",
    "byte[]"    => "Union{Vector{Int8}, Array{Int8}}",
    "uint8[]"   => "Union{Vector{UInt8}, Array{UInt8}}",
    "char[]"    => "Union{Vector{UInt8}, Array{UInt8}}",
    "int16[]"   => "Union{Vector{Int16}i, Array{UInt16}}",
    "uint16[]"  => "Union{Vector{UInt16}, Array{UInt16}}",
    "int32[]"   => "Union{Vector{<:Number}, Array{<:Number}}",
    "uint32[]"  => "Union{Vector{<:Number}, Array{<:Number}}",
    "int64[]"   => "Union{Vector{<:Number}, Array{<:Number}}",
    "uint64[]"  => "Union{Vector{<:Number}, Array{<:Number}}",
    "float32[]" => "Union{Vector{<:Number}, Array{<:Number}}",
    "float64[]" => "Union{Vector{<:Number}, Array{<:Number}}",
    "string[]"  => "Union{Vector{String}, Array{String}}",
    "time"      => "Union{Cxx.CxxCore.CppPtr, Cxx.CxxCore.CppValue, Cxx.CxxCore.CppRef}",
    "duration"  => "Union{Cxx.CxxCore.CppPtr, Cxx.CxxCore.CppValue, Cxx.CxxCore.CppRef}",
    "Header"    => "Union{Cxx.CxxCore.CppPtr, Cxx.CxxCore.CppValue, Cxx.CxxCore.CppRef}",
)

"""
    include(expr)

Inlude msg and srv files from generated ROS packages.
"""
macro include(expr)
    n = replace(string(expr), " " => "")
    n = replace(n, "(" => "")
    n = replace(n, ")" => "")
    toinclude = split(n,':')
    if length(toinclude) != 2
        throw(ErrorException("Error while trying to read @rosinclude $n"))
    end
    pkg = string(toinclude[1])
    for file in split(toinclude[2],',')
        f = joinpath(@__DIR__,"gen", "$(pkg)_$(file).jl")
        if isfile(f)
            include(f)
        else
            throw(ErrorException("Error while trying to include $f. Try running the @ROS.genNew macro."))
        end
    end
end

function scout(pkg, f)
    package_dir = package.getPath(pkg)
    # NOTE not finding the package path is 
    # not handled because the function
    # is guaranteed to be called when the
    # package is found
    if length(package_dir) > 0
        additional_folder = ""
        if occursin("/src/", package_dir) # the package was found in a catkin workspace, and not inside the ROS installation (/opt/ros/...)
            additional_folder = "devel"
            found_ws_root = false
            ws_root = package_dir
            while !found_ws_root
                ws_root = normpath(ws_root, "..")
                found_ws_root = !occursin("src", ws_root)
            end
            package_dir = joinpath(ws_root, additional_folder, "include", pkg, "$(f).h")
        else
            package_dir = joinpath(normpath(package_dir, "../.."), additional_folder, "include", pkg, "$(f).h")
        end
    end
    return package_dir
end

function startGen(pkg, file, type, fullpath, overwrite)
    jl_fname = "$(pkg)_$(file).jl"
    target = joinpath(@__DIR__,"gen",jl_fname)
    #  if isfile(target) || target != joinpath(@__DIR__,"gen","roscpp_tutorials_TwoInts.jl")
    #  if target != joinpath(@__DIR__,"gen","actionlib_tutorials_TwoInts.jl")
    #  if ! occursin("geometry_msgs", target)
    #  if ! overwrite && ! occursin("std_msgs", target)
    if ! overwrite && ! occursin("std_msgs", target)
        println(target," found but already generated. Skipping.")
    else
        thefile = joinpath(fullpath, file*"."*type)
        includes, types, fields, prefix, suffix, constants = fileAnalysis(thefile, pkg, type)
        generated = finishGen(target, pkg, file, type, includes, types, fields, prefix, suffix, constants)
        open(target, "w") do f
            write(f, generated)
        end
    end
end

function finishGen(jl_fname, pkg, name, type, includes, types, fields, prefix, suffix, constants)
    header_location = ""
    if type == "action"
        header_location = scout(pkg,name*"Action")
    else
        header_location = scout(pkg,name)
    end
    cxxinclude(header_location)
    meta = "# This file was auto-generated using typegen.jl.\n"
    meta *= "include(\"__ROSTYPE.jl\")\n"
    meta *= "cxxinclude(\"$header_location\")\n"
    for inc in includes
        inc = replace(inc, "[]"=>"")
        meta *= "cxxinclude(\"$inc\")\n"
        jl_inc = String.(split(inc, '/'))
        jl_inc1 = last(jl_inc)
        jl_inc1 = replace(jl_inc1, ".hpp"=>"")
        jl_inc1 = replace(jl_inc1, ".h"=>"")
        jl_inc2 = jl_inc[length(jl_inc)-1]
        meta *= "include(\"$(jl_inc2)_$(jl_inc1).jl\")\n"
    end
    meta *= "\n\n"


    # Minimize meta-calls
    secondary_types::Dict{String, String} = Dict()
    for s in suffix
        if !isempty(s) && !haskey(secondary_types, s)
            ptr_value = string(eval(Meta.parse("typeof(@cxxnew $pkg::$name::$s())")))
            ptr = string(eval(Meta.parse("cxxt\"$pkg::$name::$s*\"")))
            const_ptr = string(eval(Meta.parse("cxxt\"const $pkg::$name*\"")))
            secondary_types[s] = "Union{$ptr_value, $ptr, $const_ptr}"
        end
    end

    ptr_value = string(eval(Meta.parse("typeof(@cxxnew $pkg::$name())")))
    ptr = string(eval(Meta.parse("cxxt\"$pkg::$name*\"")))
    const_ptr = string(eval(Meta.parse("cxxt\"const $pkg::$name*\"")))
    main_type = "Union{$ptr_value, $ptr, $const_ptr}"

    for s in unique(suffix)
        if !isempty(s)
            meta *= "const $(pkg)_$(name)_$s = cxxt\"$pkg::$name::$s\"\n"
            meta *= "$(pkg)_$(name)_$s() = @cxxnew $pkg::$name::$s()\n\n"
        end
    end
    meta *= "const $(pkg)_$(name) = cxxt\"$pkg::$name\"\n"
    meta *= "$(pkg)_$name() = @cxxnew $pkg::$name()\n\n"

    for constant in constants
        meta *= "function getWrap(c::$main_type, f::Val{:$(constant[2])})\n"
        meta *= "    return  "
        if constant[1] == "Number"
            meta *= "parse(Float64, \"$(constant[3])\")\n"
        elseif constant[1] == "Unsigned"
            meta *= "parse(UInt64, \"$(constant[3])\")\n"
        elseif constant[1] == "String"
            meta *= "\"$(constant[3])\"\n"
        else 
            meta *= "parse($(constant[1]), \"$(constant[3])\")\n"
        end
        meta *= "end\n\n"
    end

    for i in 1:length(types)
        if !isempty(suffix[i])
            meta *= "function getWrap(c::$(secondary_types[suffix[i]]), f::Val{:$(fields[i])})\n"
        else
            meta *= "function getWrap(c::$(main_type), f::Val{:$(fields[i])})\n"
        end
        meta *= "    "
        # Primitive type
        if types[i] in values(primitive_types)
            # Special handling for string
            if types[i] == "String"
                meta *= "unsafe_string(@cxx c->$(fields[i]))\n"
            # Vector of primitives
            elseif occursin("Vector{", types[i])
                meta *= "unsafe_wrap(DenseArray, @cxx c->$(fields[i]))\n"
            # Primitive but not built-in types
            elseif startswith(types[i], "Union{")
                meta *= "@cxx &c->$(fields[i])\n"
            # Rest of built-in types
            else
                meta *= "@cxx c->$(fields[i])\n"
            end
        # Vector of misc message type
        elseif occursin("Vector{", types[i])
            meta *= "unsafe_wrap(DenseArray, @cxx c->$(fields[i]))\n"
        # Misc message type
        else
            meta *= "@cxx &c->$(fields[i])\n"
        end
        meta *= "end\n\n"
    end

    for s in unique(suffix)
        if !isempty(s)
            meta *= "function getWrap(c::$(secondary_types[s]), f)\n"
            meta *= "    throw(ErrorException(\"$pkg::$(name)$s does not have a field of \$(f)!\"))\nend\n\n"

            meta *= "function Base.getproperty(c::$(secondary_types[s]), f::Symbol)\n"
            meta *= "    getWrap(c, Val(f))\n"
            meta *= "end\n\n"
        end
    end
        
    for p in prefix
        meta *= "function getWrap(c::$main_type, f::Val{:$p})\n"
        meta *= "    @cxx &c->$p\n"
        meta *= "end\n\n"
    end

    meta *= "function getWrap(c::$main_type, f)\n"
    meta *= "    throw(ErrorException(\"$pkg::$name does not have a field of \$(f)!\"))\nend\n\n"

    meta *= "function Base.getproperty(c::$main_type, f::Symbol)\n"
    meta *= "    getWrap(c, Val(f))\n"
    meta *= "end\n\n"


    for i in 1:length(types)
        if !isempty(suffix[i])
            meta *= "function setWrap!(c::$(secondary_types[suffix[i]]), f::Val{:$(fields[i])}, value::$(types[i]))\n"
        else
            meta *= "function setWrap!(c::$(main_type), f::Val{:$(fields[i])}, value::$(types[i]))\n"
        end
        meta *= "    "
        # Primitive type
        if types[i] in values(primitive_types)
            # Special handling for string
            if types[i] == "String"
                meta *= "icxx\" \$c->$(fields[i]) = \$(pointer(value));\"\n"
            elseif occursin("Vector{", types[i])
                #  meta *= "icxx\" \$c->$(fields[i]) = \$(pointer(value));\"\n"
                meta *= "icxx\" \$c->$(fields[i]).clear();\"\n"
                meta *= "    for i in 1:length(value)\n"
                meta *= "        icxx\" \$c->$(fields[i]).push_back(\$(value[i]));\"\n"
                meta *= "    end\n"
            # Primitive but not built-in types
            elseif startswith(types[i], "Union{")
                meta *= "icxx\" \$c->$(fields[i]) = \$value;\"\n"
            # Rest of built-in types
            else
                meta *= "icxx\" \$c->$(fields[i]) = \$value;\"\n"
            end
        # Misc message type
        else
            meta *= "icxx\" \$c->$(fields[i]) = \$value;\"\n"
        end
        meta*= "end\n\n"
    end

    for s in unique(suffix)
        if !isempty(s)
            meta *= "function setWrap!(c::$(secondary_types[s]), f, value)\n"
            meta *= "    throw(ErrorException(\"$pkg::$name does not have a field of \$(f)!\"))\nend\n\n"

            meta *= "function Base.setproperty!(c::$(secondary_types[s]), f::Symbol, value)\n"

            meta *= "    setWrap!(c, Val(f), value)\n"
            meta *= "end\n\n"
        end
    end

    meta *= "function setWrap!(c::$main_type, f, value)\n"
    meta *= "    throw(ErrorException(\"$pkg::$name does not have a field of \$(f)!\"))\nend\n\n"

    meta *= "function Base.setproperty!(c::$main_type, f::Symbol, value)\n"

    meta *= "    setWrap!(c, Val(f), value)\n"
    meta *= "end\n\n"

    return meta
end

function fileAnalysis(file, parent_pkg, t)
    p = ["", "request", "response", "goal", "result", "feedback"]
    s = ["", "Request", "Response", "Goal", "Result", "Feedback", "ActionGoal", "ActionResult", "ActionFeedback"]
    includes::Vector{String} = []
    types::Vector{String} = []
    fields::Vector{String} = []
    # Constants contain type,field,value
    constants::Vector{Tuple{String, String, String,String,String}} = []
    # The prefix vector is used for services and actions
    # to include one of the values of p
    prefix::Vector{String} = []
    # The suffix vector is used for services and actions
    # to include one of the values of s
    suffix::Vector{String} = []
    pindex = 1
    if t == "srv"
        pindex += 1
        push!(prefix, p[pindex])
    elseif t == "action"
        pindex += 3
        push!(prefix, p[pindex])
    end
    for line in eachline(file)
        line = strip(replace(line, r"#.*" => ""))
        # Not a comment
        if !isempty(line)
            # Change of service/action definition
            if line == "---"
                pindex += 1
                push!(prefix, p[pindex])
            # Not a constant
            elseif !('=' in line)
                type,field = String.(split(line))
                if type == "Header"
                    type = "std_msgs/Header"
                end
                if haskey(primitive_types, type)
                    type = primitive_types[type]
                else
                    if !occursin("/", type)
                        type = parent_pkg * "/" * type
                    end
                    pkg, f = String.(split(type, '/'))
                    push!(includes, scout(pkg,f))
                    type = replace(type, '/' => '.')
                end
                if occursin(".", type)
                    if endswith(type, "[]")
                        type = "Vector{Union{Cxx.CxxCore.CppPtr, Cxx.CxxCore.CppValue, Cxx.CxxCore.CppRef}}"
                    else
                        type = "Union{Cxx.CxxCore.CppPtr, Cxx.CxxCore.CppValue, Cxx.CxxCore.CppRef}"
                    end
                end
                push!(types, type)
                push!(fields, field)
                push!(suffix, s[pindex])
                #  if t == "action"
                    #  push!(types, type)
                    #  push!(fields, field)
                    #  push!(suffix, "Action"*s[pindex])
                #  end
            else
                typefield, value = String.(split(line, '='))
                type, field = String.(split(typefield))
                push!(constants, (type,field,value,p[pindex],s[pindex]))
            end
        end
    end
    return includes, types, fields, prefix, suffix, constants
end

function msgGenerator(overwrite=false)
    println("Generating ROS types...")
    #  types_of_interest = ["msg", "srv", "action"]
    types_of_interest = ["msg", "srv"]
    packages = package.getAll()
    for p in packages
        pp = package.getPath(p)
        for t in types_of_interest
            d = joinpath(pp, t)
            if isdir(d)
                for file in readdir(d)
                    suffix_pos = findlast(isequal('.'),file)
                    if suffix_pos != nothing && file[nextind(file,suffix_pos):end] == t
                        startGen(p, file[1:prevind(file, suffix_pos)], t, d, overwrite)
                    end
                end
            end
        end
    end
end

"""
    genNew()

Initiate the generation of Julia code for all newly found msg and srv ROS packages.
"""
macro genNew()
    msgGenerator(false)
end

"""
    updateAll()

Initiate the generation of Julia code for all msg and srv ROS packages (new and already existing ones).
"""
macro updateAll()
    msgGenerator(true)
end

