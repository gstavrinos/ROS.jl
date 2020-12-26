
ROS.init("testTime")
nh = ROS.NodeHandle()
r = ROS.Rate(2)
d = ROS.Duration(2)
t = ROS.Time(2)
ROS.Rate(d)
ROS.reset(r)
ROS.sleep(r)
ROS.cycleTime(r)
ROS.expectedCycleTime(r)

ROS.Duration()
ROS.Duration(r)
ROS.Duration(2,3)
ROS.sleep(d)
@test ROS.toSec(d) == 2

ROS.Time()
ROS.Time(2,3)
@test ROS.toSec(t) == 2
ROS.init(t)
@test !ROS.isSimTime(t)
@test ROS.isSystemTime(t)
@test ROS.isValid(t)
ROS.now(t)
ROS.setNow(t, ROS.now())
ROS.setNow(t, ROS.Time(0))
ROS.sleepUntil(t, ROS.now())
ROS.useSystemTime(t)
ROS.shutdown(t)
t1 = ROS.now()
t.sec = t1.sec + 2
t.nsec = 0
ROS.toSec(t1 + d)
@test ROS.toSec(d + d) == 4
@test ROS.toSec(d - d) == 0
ROS.waitForValid(t)

println("All $(basename(@__FILE__)) tests passed.")
