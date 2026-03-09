# Costmap,Planner,and Controller

In the ROS2 Nav2 navigation system,three important components work together to guide the robot to a goal

These modules help the robot understand the environment,plan a path,and move safely to the target.

## Costmap

The costmap represents the environment around the robots.

It uses data from sensors such as LiDAR to detect obstacles and mark areas thar the robot should avoid.

This helps the robot understand which areas are safely to travel.

## Planner

The planner is responsible for finding a path from the robot's current position to the goal.

## Controller

The controller is responsible for following the planned path.

It generates velocity commands that move the robot along the path.

While moving, the controller continuously checks sensor data and the costmap to avoid obstacles and adjust motion if necessary.

## Role Navigation

These three components work together during navigation.

Together they allow the robot to navigate autonomously in the environment.