#!/usr/bin/env bash
set -e

source "$HOME/ros2-nav-learning/config/env_sim.sh"

SESSION="$TMUX_SESSION"

echo "[INFO] Stopping ROS2 simulation system..."

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "[INFO] Killing tmux session: $SESSION"
    tmux kill-session -t "$SESSION"
else
    echo "[INFO] No tmux session found."
fi

sleep 1

echo "[INFO] Cleaning remaining processes..."

pkill -f gazebo || true
pkill -f gzserver || true
pkill -f gzclient || true
pkill -f rviz2 || true
pkill -f nav2 || true
pkill -f amcl || true
pkill -f map_server || true
pkill -f robot_state_publisher || true
pkill -f spawn_entity || true

sleep 1

echo "[INFO] Cleaning ROS logs..."
rm -rf ~/.ros/log/* 2>/dev/null || true

echo
echo "=============================="
echo " Simulation stopped cleanly "
echo "=============================="