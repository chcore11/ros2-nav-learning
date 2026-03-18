#!/usr/bin/env bash
set -e

SESSION="ros2_nav"

echo "[INFO] Stopping ROS2 navigation system..."

# 1️⃣ 关闭 tmux session（最干净的方法）
if tmux has-session -t $SESSION 2>/dev/null; then
    echo "[INFO] Killing tmux session: $SESSION"
    tmux kill-session -t $SESSION
else
    echo "[INFO] No tmux session found."
fi

sleep 1

# 2️⃣ 杀掉残留 ROS2 / Gazebo / RViz 进程（保险）
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

# 3️⃣ 清理 ROS 日志（可选）
echo "[INFO] Cleaning ROS logs..."
rm -rf ~/.ros/log/* 2>/dev/null || true

echo
echo "=============================="
echo "  Simulation stopped cleanly  "
echo "=============================="