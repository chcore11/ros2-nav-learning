#!/usr/bin/env bash
source ~/ros2-nav-learning/config/env.sh

tmux kill-session -t $TMUX_SESSION
echo "robot_dev stopped"
