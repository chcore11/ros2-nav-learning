Nav2 is not a single program but a navigation system composed of multiple ROS2 nodes.

Key nodes include AMCL for localization, planner_server for global path planning,
controller_server for motion control, and bt_navigator for behavior tree execution.

The system is launched through `navigation2.launch.py`, which serves as the entry
point for the TurtleBot3 navigation setup. This launch file calls the Nav2 bringup
process, which starts the required navigation nodes.

A lifecycle manager is responsible for managing the state transitions of these
nodes. It ensures that nodes are configured and activated in the correct order,
allowing the navigation system to start in a stable and controlled manner.