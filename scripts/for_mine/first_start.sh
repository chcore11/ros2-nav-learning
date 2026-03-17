#!/usr/bin/env bash
set -euo pipefail

SESSION="day19_nav"
PROJECT_DIR="$HOME/ros2-nav-learning"
WS_DIR="$PROJECT_DIR/workspace"
WORLD_FILE="$PROJECT_DIR/world/my_world/my_world.world"
MAP_FILE="$PROJECT_DIR/maps/my_map.yaml"

ROS_SETUP="/opt/ros/humble/setup.bash"
WS_SETUP="$WS_DIR/install/setup.bash"
COMMON_SOURCE="source $ROS_SETUP && source $WS_SETUP"

echo "[INFO] killing old ROS/Gazebo/RViz processes..."
pkill -9 gzserver 2>/dev/null || true
pkill -9 gzclient 2>/dev/null || true
pkill -9 rviz2 2>/dev/null || true
pkill -9 robot_state_publisher 2>/dev/null || true
pkill -9 amcl 2>/dev/null || true
pkill -9 map_server 2>/dev/null || true
pkill -9 planner_server 2>/dev/null || true
pkill -9 controller_server 2>/dev/null || true
pkill -9 bt_navigator 2>/dev/null || true
pkill -9 lifecycle_manager 2>/dev/null || true

sleep 2

if tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux kill-session -t "$SESSION"
fi

echo "[INFO] creating tmux session: $SESSION"
tmux new-session -d -s "$SESSION" -n main

# 初始 pane
P0=$(tmux display-message -p -t "$SESSION:0.0" "#{pane_id}")

# Gazebo
tmux send-keys -t "$P0" "$COMMON_SOURCE && ros2 launch gazebo_ros gazebo.launch.py world:=$WORLD_FILE" C-m

sleep 8

echo "[INFO] checking /clock ..."
bash -lc "$COMMON_SOURCE && timeout 5 ros2 topic echo /clock --once" >/dev/null 2>&1 || {
  echo "[ERROR] /clock not available. Check Gazebo first."
  echo "tmux attach -t $SESSION"
  exit 1
}
echo "[INFO] /clock is available."

# 左下 pane：robot
P1=$(tmux split-window -v -t "$P0" -P -F "#{pane_id}")
tmux send-keys -t "$P1" "cd $WS_DIR && $COMMON_SOURCE && ros2 launch my_robot_description spawn_robot.launch.py x:=-2.0 y:=-2.0 z:=0.1" C-m

sleep 6

# 右上 pane：RViz
P2=$(tmux split-window -h -t "$P0" -P -F "#{pane_id}")
tmux send-keys -t "$P2" "$COMMON_SOURCE && rviz2 --ros-args -p use_sim_time:=true" C-m

sleep 5

# 右下 pane：localization
P3=$(tmux split-window -h -t "$P1" -P -F "#{pane_id}")
tmux send-keys -t "$P3" "$COMMON_SOURCE && ros2 launch nav2_bringup localization_launch.py use_sim_time:=true map:=$MAP_FILE" C-m

sleep 6

# 第二个 window：navigation
tmux new-window -t "$SESSION" -n navigation
P4=$(tmux display-message -p -t "$SESSION:1.0" "#{pane_id}")
tmux send-keys -t "$P4" "$COMMON_SOURCE && ros2 launch nav2_bringup navigation_launch.py use_sim_time:=true" C-m

tmux select-window -t "$SESSION:0"
tmux select-layout -t "$SESSION:0" tiled

echo
echo "[DONE] tmux session '$SESSION' is ready."
echo "[INFO] attach with:"
echo "  tmux attach -t $SESSION"