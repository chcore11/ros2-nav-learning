# SLAM Mapping

SLAM(Simultaneous Localization and Mapping)is the process that allows a robot to build a map of an unknown environment while moving inside it.

In ROS2 navigation systems,SLAM is used to generate a map that can later be used for localization and navigation.

## What SLAM does

SLAM allows the robot to:
 - explore an unknown environment
 - collect sensor data
 - estimate its own motion
 - build a map at the same time

 The robot uses sensors such as laser to gradually construct a map of the environment

 ## How it works
 
 In this project,the robot move around the environment while collecting laser scan data.
 
 Over time a complete occupancy grid map is generated

 ## Output of SLAM

The result of SLAM is a "2D occupancy grid map"