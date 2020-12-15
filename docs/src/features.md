# Features
* Automatic/Dynamic Julia msg and srv type generation
    * Using the `@genNew` and `@updateAll` macros users can request from ROS.jl to generate Julia types for all discovered message and service types.
    * Include generated types using the `@include` macro.
* NodeHandles
    * Parameters
    * Publishers/Subscribers
    * Service Clients/Servers
    * Shutdown
* Publishers and Subscribers
    * Get topic
    * Get number of subscribers/publishers
    * Shutdown
* Service Servers and Clients
    * Get service
    * Call services
    * Shutdown
* Action Servers and Clients
    * Goals
    * Feedback
    * Results
    * Status
    * Wait
    * Cancel
* ROS Package
    * rospack commands
    * Get package path
    * Get all packages
* ROS Time
    * Rate
    * Duration
    * Time
    * Get/Set Now
    * Sleep
* TF2
    * (Static) Transform Broadcasters
    * Transform Listeners
    * Buffers
    * Transformation checks
    * Lookup transformations
    * Transformation calculations
