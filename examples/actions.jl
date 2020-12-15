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

