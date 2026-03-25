# 🚀 ROS2 Navigation Learning Project

<div align="center">

![ROS2](https://img.shields.io/badge/ROS2-Humble-blue?style=flat-square\&logo=ros)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?style=flat-square\&logo=ubuntu)
![Status](https://img.shields.io/badge/Stage--1-Completed-success?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

---

**A complete ROS2 Navigation pipeline built from scratch, with system-level understanding and engineering structure.**

</div>

## 👤 About This Project

This project was built as part of my learning journey in robotics and ROS2.

Starting from zero, I focused on not only making the system run, but also understanding how each module works together as a complete navigation pipeline.

This repository represents a full simulation-based navigation system and serves as the foundation for further development towards real robot control and embedded systems.

---

## 🎯 What This Project Does

This project builds a **full end-to-end ROS2 navigation system** in simulation:

```
Gazebo → SLAM → Map → AMCL → Nav2 → Autonomous Navigation
```

It demonstrates how a robot can:

* build a map
* localize itself
* plan paths
* avoid obstacles
* navigate to a goal

---

## 🧠 Key Insight

Navigation is not a single module.

It is a system composed of:

* **Localization (AMCL)** → where the robot is
* **Planning (planner_server)** → where to go
* **Control (controller_server)** → how to move
* **Costmap** → where it is safe to move
* **TF system** → coordinate consistency

---

## ⚙️ System Pipeline

```
RViz Goal
→ bt_navigator
→ planner_server
→ global path
→ controller_server
→ /cmd_vel
→ robot motion
```

Supporting flows:

* `/scan → costmap → planner / controller`
* `map + scan + odom → AMCL → pose`

---

## 📍 Current Status

✅ Stage 1 Completed — Full Navigation Pipeline Verified

The system can:

* Perform SLAM mapping
* Save and load maps
* Localize using AMCL
* Navigate autonomously
* Avoid obstacles using costmaps

---

## 🖥️ Environment

* OS: Ubuntu 22.04 (WSL2)
* ROS2: Humble
* Simulator: Gazebo
* Robot: TurtleBot3
* Language: Python (rclpy)

---

## 📂 Project Structure

```
ros2-nav-learning/
├── docs/         # System explanations (architecture, TF, navigation)
├── logs/         # Daily logs and debugging records
├── assets/       # Diagrams (architecture, TF tree)
├── scripts/      # Startup scripts
├── workspace/    # ROS2 packages
├── maps/         # Saved maps
└── README.md
```

---

## 📚 Documentation

Core system explanations:

* Nav2 Architecture
* TF Tree (map → odom → base_link)
* SLAM Mapping
* AMCL Localization
* Costmap / Planner / Controller

---

## 🚀 How to Run

```bash
# Start full navigation system
./scripts/start.sh
```

---

## 📈 Project Focus

This project emphasizes:

* robotics system architecture
* ROS2 debugging capability
* navigation system understanding
* reproducible engineering workflows

---

## 🏆 Stage 1 Milestone

A complete and stable ROS2 navigation system has been built and verified.

This marks the transition from:

> “able to run” → “able to understand and explain”

---

## 🔜 Next Steps

The next stage of this project will focus on transitioning from simulation to real-world systems:

- Integrating embedded systems (Arduino / MCU) for motor control
- Bridging ROS2 with hardware via serial communication
- Implementing odometry feedback (encoder-based)
- Building a minimal mobile robot base

This marks the evolution from:

> Simulation-based navigation → Real robot system integration

---

## 📌 Note

This project is continuously evolving as part of a robotics learning and engineering journey.
