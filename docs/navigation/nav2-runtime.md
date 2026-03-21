# Nav2 Runtime Architecture

## Full System View

RViz Goal
→ bt_navigator
→ planner_server
→ global path
→ controller_server
→ /cmd_vel
→ velocity_smoother
→ turtlebot3_diff_drive
→ Robot Motion in Gazebo

## Localization Pipeline

/map
→ map_server
→ AMCL

/scan
→ AMCL

/odom
→ AMCL

AMCL
→ robot pose in map
→ map → odom transform

## Costmap System

/global_costmap
- used by planner_server
- built from:
  - static_layer
  - obstacle_layer
  - voxel_layer
  - inflation_layer

/local_costmap
- used by controller_server
- built from:
  - obstacle_layer
  - voxel_layer
  - inflation_layer

## Planning and Control

planner_server
→ computes global path from current pose to goal

controller_server
→ follows the global path
→ samples candidate trajectories
→ scores trajectories
→ outputs /cmd_vel

velocity_smoother
→ smooths velocity commands before sending them to the robot base

## Behavior and Recovery

bt_navigator
→ coordinates the navigation task using a Behavior Tree

behavior_server
→ provides recovery behaviors and supporting actions

waypoint_follower
→ executes multi-goal waypoint navigation

smoother_server
→ refines paths when needed

## Launch and Lifecycle

navigation2.launch.py
→ entry point of TurtleBot3 navigation launch

navigation2.launch.py
→ calls bringup_launch.py

bringup_launch.py
→ starts Nav2-related nodes

lifecycle_manager_localization
→ manages localization node startup

lifecycle_manager_navigation
→ manages navigation node startup

Lifecycle flow:
unconfigured
→ inactive
→ active

The lifecycle managers ensure that nodes are configured and activated in the correct order.

## Core Understanding

Nav2 is not a single program.
It is a navigation system composed of multiple ROS2 nodes.

Main roles:
- AMCL decides where the robot is
- planner_server decides where to go
- controller_server decides how to move
- costmaps decide which space is safe
- bt_navigator coordinates the whole navigation process

## Architecture Diagram

+-------------------+
|     RViz Goal     |
+-------------------+
          |
          v
+-------------------+
|   bt_navigator    |
+-------------------+
          |
          v
+-------------------+
|  planner_server   |
+-------------------+
          |
          v
      global path
          |
          v
+-------------------+
| controller_server |
+-------------------+
          |
          v
       /cmd_vel
          |
          v
+-------------------+
| velocity_smoother |
+-------------------+
          |
          v
+-------------------+
| turtlebot3 base   |
|  (diff drive)     |
+-------------------+
          |
          v
   Robot Motion

Supporting system:

/map   → map_server → global_costmap
/scan  → AMCL
/scan  → local_costmap
/scan  → global_costmap
/odom  → AMCL

AMCL → robot pose in map
AMCL → map → odom

global_costmap → planner_server
local_costmap  → controller_server