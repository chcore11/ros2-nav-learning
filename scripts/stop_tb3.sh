#!/usr/bin/env bash
set -e

source "$HOME/ros2-nav-learning/config/env_tb3.sh"

tmux kill-session -t "$TMUX_SESSION" 2>/dev/null || true
echo "$TMUX_SESSION stopped"