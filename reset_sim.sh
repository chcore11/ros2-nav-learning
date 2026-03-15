#!/bin/bash

echo "Force stopping Gazebo / RViz / ROS2 navigation processes..."

pkill -9 -f gzserver
pkill -9 -f gzclient
pkill -9 -f gazebo
pkill -9 -f rviz2
pkill -9 -f robot_state_publisher
pkill -9 -f joint_state_publisher
pkill -9 -f spawn_entity.py
pkill -9 -f nav2
pkill -9 -f amcl
pkill -9 -f map_server
pkill -9 -f planner_server
pkill -9 -f controller_server
pkill -9 -f bt_navigator
pkill -9 -f lifecycle_manager

sleep 2

echo "Remaining related processes:"
ps aux | egrep "gzserver|gzclient|gazebo|rviz2|robot_state_publisher|joint_state_publisher|spawn_entity|nav2|amcl|map_server|planner_server|controller_server|bt_navigator|lifecycle_manager"

echo "Reset done."