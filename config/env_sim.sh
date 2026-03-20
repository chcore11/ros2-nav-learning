#!/usr/bin/env bash

# tmux session
export TMUX_SESSION=sim_dev

# ROS setup
export ROS_SETUP=/opt/ros/humble/setup.bash
export WS_SETUP=$HOME/ros2-nav-learning/workspace/install/setup.bash

# simulation config
export USE_SIM_TIME=true
export WORLD_PATH=$HOME/ros2-nav-learning/world/my_world/sim_world.world
export MAP_YAML=$HOME/ros2-nav-learning/maps/sim_map.yaml
export RVIZ_CFG=$HOME/ros2-nav-learning/rviz/nav2.rviz