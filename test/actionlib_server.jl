ROS.@include actionlib_tutorials: FibonacciAction, FibonacciFeedback, FibonacciResult, FibonacciGoal

action_server = nothing
callback_enabled = false

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
    ROS.actionlib.setAborted(action_server, ROS.actionlib_tutorials_FibonacciResult(), "result")
    ROS.actionlib.setAborted(action_server)
    ROS.actionlib.setPreempted(action_server, ROS.actionlib_tutorials_FibonacciResult(), "result")
    ROS.actionlib.setPreempted(action_server)
    ROS.actionlib.setSucceeded(action_server)
    global callback_enabled = true
    return nothing
end

function testActionServer()
    ROS.init("testActionlibServer")
    nh = ROS.NodeHandle()

    global action_server = ROS.actionlib.SimpleActionServer("test_action_server", ROS.actionlib_tutorials_FibonacciAction)
    ROS.actionlib.start(action_server)
    @test ! ROS.actionlib.isActive(action_server)
    ROS.actionlib.registerGoalCallback(action_server, execute_cb)
    ROS.actionlib.registerPreemptCallback(action_server, execute_cb)
    ROS.actionlib.isNewGoalAvailable(action_server)
    ROS.actionlib.isPreemptRequested(action_server)

    loop = 500
    while loop > 0 && !callback_enabled
        loop -= 1
        ROS.sleep(ROS.Rate(10))
        ROS.spinOnce()
    end
    @test callback_enabled
    ROS.actionlib.shutdown(action_server)
    ROS.shutdown(nh)
    println("All $(basename(@__FILE__)) tests passed.")
end

