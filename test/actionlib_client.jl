ROS.@include actionlib_tutorials: FibonacciAction, FibonacciFeedback, FibonacciResult, FibonacciGoal

function testActionClient()
    ROS.init("testActionlibClient")
    nh = ROS.NodeHandle()

    action_client = ROS.actionlib.SimpleActionClient("test_action_server", ROS.actionlib_tutorials_FibonacciAction, true)
    #  ROS.actionlib.waitForServer(action_client)
    ROS.actionlib.waitForServer(action_client, ROS.Duration(120))
    ROS.actionlib.sendGoal(action_client, ROS.actionlib_tutorials_FibonacciGoal())
    ROS.actionlib.waitForResult(action_client, ROS.Duration(3))
    ROS.actionlib.sendGoalAndWait(action_client, ROS.actionlib_tutorials_FibonacciGoal(), ROS.Duration(3), ROS.Duration(5))

    action_result_called = ROS.actionlib.getResult(action_client)
    ROS.actionlib.cancelAllGoals(action_client)
    ROS.actionlib.cancelGoal(action_client)
    state = ROS.actionlib.getState(action_client)
    ROS.actionlib.getText(state)
    ROS.actionlib.isDone(state)
    ROS.actionlib.toString(state)
    ROS.actionlib.isServerConnected(action_client)

    ROS.actionlib.stopTrackingGoal(action_client)
    ROS.shutdown(nh)
    println("All $(basename(@__FILE__)) tests passed.")
end

