# Nav2 Navigation

Nav2 (navigation2) is the navigation frame work used in ROS2 to enable autonomous robot movement

It allows the robot to plan paths and move to the target location automatically.

## What Nav2 Does

Nav2 takes a goal position and calculates how the robot should move to reach it.

Information from:
- the static map
- robot localization
- sensor data such as laser scans

With these,Nav2 can guide the robot safely through environment.

## How it Works

When a goal is given in RViz2:

1. The global planner calculates a path from the robot to the goal.
2. The local planner generates motion commands to follow the path.
3. Sensor data is used to detect obstacles and adjust movement.

This process runs continuously until the robot reaches the target.

## Role in This Project

In this project,Nav2 is used after mapping and localization are complete.
