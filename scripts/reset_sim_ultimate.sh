#!/bin/bash

echo "=============================="
echo " Resetting ROS2 Simulation"
echo "=============================="

echo "[1] Killing Gazebo..."
pkill -9 -f gzserver
pkill -9 -f gzclient
pkill -9 -f gazebo

echo "[2] Killing RViz..."
pkill -9 -f rviz2

echo "[3] Killing robot publishers..."
pkill -9 -f robot_state_publisher
pkill -9 -f joint_state_publisher

echo "[4] Killing spawn processes..."
pkill -9 -f spawn_entity

echo "[5] Killing Nav2 stack..."
pkill -9 -f nav2
pkill -9 -f amcl
pkill -9 -f map_server
pkill -9 -f planner_server
pkill -9 -f controller_server
pkill -9 -f bt_navigator
pkill -9 -f lifecycle_manager

echo "[6] Cleaning ROS logs..."
rm -rf ~/.ros/log/*

sleep 1

echo "=============================="
echo " Simulation Reset Complete"
echo "=============================="