#!/usr/bin/env bash
set -euo pipefail

source "$HOME/ros2-nav-learning/config/env_tb3.sh"

SESSION="$TMUX_SESSION"

if tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux attach -t "$SESSION"
  exit 0
fi

tmux new-session -d -s "$SESSION" -n GAZEBO
tmux send-keys -t "$SESSION:GAZEBO" \
"source ~/.bashrc && export TURTLEBOT3_MODEL=$TURTLEBOT3_MODEL && ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py" C-m

sleep 3

tmux new-window -t "$SESSION" -n NAV2
tmux send-keys -t "$SESSION:NAV2" \
"source ~/.bashrc && export TURTLEBOT3_MODEL=$TURTLEBOT3_MODEL && ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$MAP_YAML" C-m

tmux new-window -t "$SESSION" -n DEBUG
tmux send-keys -t "$SESSION:DEBUG" \
"source ~/.bashrc && cd ~/ros2-nav-learning && echo DEBUG ready" C-m

tmux attach -t "$SESSION"