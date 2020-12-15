export Rate, reset, sleep, cycleTime, expectedCycleTime
export Duration, Time, init, isSimTime, isSystemTime, isValid, toSec
export now, setNow, shutdown, sleepUntil, useSystemTime, waitForValid

# --- Rate ---

"""
    Rate(frequency::Number)

Constructor, creates a Rate.
"""
Rate(frequency::Number) = @cxxnew ros::Rate(frequency)

"""
    Rate(duration)

Constructor, creates a Rate from a Duration.
"""
Rate(duration::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}) = @cxxnew ros::Rate(*(duration))

"""
    reset(rate)

Sets the start time for the rate to now.
"""
reset(rate::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N}) = @cxx rate->reset() 

"""
    sleep(rate)

Sleeps for any leftover time in a cycle. Calculated from the last time sleep, reset, or the constructor was called.
"""
sleep(rate::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N}) = @cxx rate->sleep() 

"""
    cycleTime(rate)

Get the actual run time of a cycle from start to sleep.
"""
cycleTime(rate::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N}) = @cxx rate->cycleTime()

"""
    expectedCycleTime(rate)

Get the expected cycle time – one over the frequency passed in to the constructor.
"""
expectedCycleTime(rate::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N}) = @cxx rate->expectedCycleTime()

# --- Duration ---
"""
    Duration()

Default constructor, creates a Duration.
"""
Duration() = @cxxnew ros::Duration()

"""
    Duration(t::Number)

Constructor, creates a Duration.
"""
Duration(t::Number) = @cxxnew ros::Duration(t)

"""
    Duration(rate)

Constructor, creates a Duration from a Rate.
"""
Duration(rate::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Rate")},(false, false, false)},N} where N,(false, false, false)}) = @cxxnew ros::Duration(*(rate))

"""
    Duration(sec::Int, nsec::Int)

Constructor, creates a Duration.
"""
Duration(sec::Int, nsec::Int) = @cxxnew ros::Duration(sec, nsec)

"""
    sleep(duration)

Sleep for the amount of time specified by this Duration. If a signal interrupts the sleep, resleeps for the time remaining.
"""
sleep(duration::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N}) = @cxx duration->sleep() 

"""
    toSec(duration)

Turn Duration into floating point seconds.
"""
toSec(duration::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Duration")},(false, false, false)},N} where N}) = @cxx duration->toSec() 

# --- Time ---
"""
    Time()

Default constructor, creates Time.
"""
Time() = @cxxnew ros::Time()

"""
    Time(t::Number)

Constructor, creates Time.
"""
Time(t::Number) = @cxxnew ros::Time(t)

"""
    Time(sec::Int, ncsec::Int)

Constructor, creates Time.
"""
Time(sec::Int, nsec::Int) = @cxxnew ros::Time(sec, nsec)

"""
    init(time)

Initialise Time.
"""
init(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->init() 

"""
    isSimTime(time)

Returns whether or not sim time is used.
"""
isSimTime(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->isSimTime() 

"""
    isSystemTime(time)

Returns whether or not system time is used.
"""
isSystemTime(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->isSystemTime()

"""
    isValid(time)

Returns whether or not the current time source is valid. Simulation time is valid if it is non-zero.
"""
isValid(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->isValid()

"""
    now(time)

Retrieve the current time. If ROS clock time is in use, this returns the time according to the ROS clock. Otherwise returns the current wall clock time.
"""
now(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->now()

"""
    setNow(time, now) = @cxx t->setNow(now)

Set now to `now` time.
"""
setNow(t::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, now::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N) = @cxx t->setNow(now)

setNow(t::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, now::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}) = @cxx t->setNow(*(now))

setNow(t::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, now::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N) = @cxx t->setNow(now)

setNow(t::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, now::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}) = @cxx t->setNow(*(now))

"""
    shutdown(time)    

Shuts down the Time.
"""
shutdown(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->shutdown()

"""
    sleepUntil(time, _end)

Sleep until a specific time has been reached. 
"""
sleepUntil(t::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, _end::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N) = @cxx t->sleepUntil(_end)

sleepUntil(t::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, _end::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}) = @cxx t->sleepUntil(*(_end))

sleepUntil(t::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, _end::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N) = @cxx t->sleepUntil(_end)

sleepUntil(t::Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N, _end::Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}) = @cxx t->sleepUntil(*(_end))

"""
    useSystemTime(time)

Switch to system time.
"""
useSystemTime(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->useSystemTime()

"""
    waitForValid(time)

Wait for time source to become valid. 
"""
waitForValid(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->waitForValid()

"""
    toSec(time)

Turn Time into floating point seconds.
"""
toSec(t::Union{Cxx.CxxCore.CppPtr{Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N,(false, false, false)}, Cxx.CxxCore.CppValue{Cxx.CxxCore.CxxQualType{Cxx.CxxCore.CppBaseType{Symbol("ros::Time")},(false, false, false)},N} where N}) = @cxx t->toSec()

