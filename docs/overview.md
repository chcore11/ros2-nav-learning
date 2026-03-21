# Project Overview

This project builds a complete ROS2 navigation system.

---

## System Pipeline

ROS2 → TF → SLAM → Map → AMCL → Nav2 → Planner → Controller

---

## Key Components

- Gazebo simulation
- SLAM mapping
- AMCL localization
- Nav2 navigation system

---

## Key Features

- modular system design
- environment-based configuration (env.sh)
- tmux-based launch system
- stable navigation pipeline

---

## How to Run

```bash
./scripts/start_sim.sh