module package
using Cxx
export getAll, getPath, command

"""
    getAll()

Gets a vector of all packages.
"""
getAll() = convert(Vector{String}, icxx"std::vector<std::string> s; ros::package::getAll(s); return s;")

"""
    getPath(s::String)

Returns the fully-qualified path to a package, or an empty string if the package is not found.
"""
getPath(s::String) = unsafe_string(@cxx ros::package::getPath(pointer(s)))

"""
    command(s::String)

Runs a rospack command of the form 'rospack `s`', returning the output as a single string.
"""
command(s::String) = unsafe_string(@cxx ros::package::command(pointer(s)))

end
