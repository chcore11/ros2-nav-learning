#!/usr/bin/env bash
set -euo pipefail

source "$HOME/ros2-nav-learning/config/env_sim.sh"

SESSION="$TMUX_SESSION"
COMMON_CMD="source $ROS_SETUP && source $WS_SETUP"

echo "[INFO] Killing old tmux session if exists..."
tmux kill-session -t "$SESSION" 2>/dev/null || true

echo "[INFO] Creating tmux session: $SESSION"
tmux new-session -d -s "$SESSION" -n gazebo

# Window 0: Gazebo
tmux send-keys -t "$SESSION:0" \
"$COMMON_CMD && ros2 launch gazebo_ros gazebo.launch.py world:=$WORLD_PATH" C-m

echo "[INFO] Waiting for Gazebo/world to stabilize..."
sleep 5

# Window 1: Robot
tmux new-window -t "$SESSION" -n robot
tmux send-keys -t "$SESSION:1" \
"$COMMON_CMD && ros2 launch my_robot_description spawn_robot.launch.py" C-m

echo "[INFO] Waiting for robot spawn..."
sleep 5

# Window 2: Navigation
tmux new-window -t "$SESSION" -n nav
tmux send-keys -t "$SESSION:2" \
"$COMMON_CMD && ros2 launch nav2_bringup navigation_launch.py use_sim_time:=$USE_SIM_TIME" C-m

echo "[INFO] Waiting for navigation stack..."
sleep 4

# Window 3: RViz
tmux new-window -t "$SESSION" -n rviz
tmux send-keys -t "$SESSION:3" \
"$COMMON_CMD && rviz2 -d $RVIZ_CFG --ros-args -p use_sim_time:=$USE_SIM_TIME" C-m

echo "[INFO] Waiting for RViz to open..."
sleep 4

# Window 4: Localization
tmux new-window -t "$SESSION" -n local
tmux send-keys -t "$SESSION:4" \
"$COMMON_CMD && ros2 launch nav2_bringup localization_launch.py use_sim_time:=$USE_SIM_TIME map:=$MAP_YAML" C-m

echo
echo "========================================"
echo " tmux session ready: $SESSION"
echo "========================================"
echo "Startup order:"
echo "  0 -> gazebo"
echo "  1 -> robot"
echo "  2 -> nav"
echo "  3 -> rviz"
echo "  4 -> local"
echo
echo "Next steps:"
echo "  1. Wait until map appears in RViz"
echo "  2. Click 2D Pose Estimate"
echo "  3. Then click 2D Goal Pose"
echo
echo "Attach command:"
echo "  tmux attach -t $SESSION"

tmux attach -t "$SESSION"