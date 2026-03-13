ROS2 Navigation Learning Project

# ros2-nav-learning

# ros2-nav-learning

<div align="center">

![ROS2](https://img.shields.io/badge/ROS2-Humble-blue?style=flat-square&logo=ros)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?style=flat-square&logo=ubuntu)
![Status](https://img.shields.io/badge/Stage--1-Completed-success?style=flat-square&logo=checkmarx)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

---

**A comprehensive ROS2 navigation learning project. Stage 1: Simulation and Nav2 pipeline successfully verified.**

</div>

🎯 Project Goal

Build a complete end-to-end ROS2 navigation system in simulation using:

Gazebo + RViz2 + SLAM + AMCL + Nav2

The project focuses on system-level understanding, engineering reproducibility, and structured documentation.

This repository is developed as a robotics internship portfolio project.

🖥️ Environment

OS: Ubuntu 22.04 (WSL2)

ROS2: Humble Desktop

Simulator: Gazebo

Robot: TurtleBot3

Language: Python (rclpy)

Build Tool: colcon

📍 Current Status

Stage 1 completed.

The project now supports full autonomous navigation in simulation.

Completed pipeline:

Gazebo Simulation
→ SLAM Mapping
→ Map Save / Load
→ AMCL Localization
→ Nav2 Navigation
→ RViz Goal Navigation

The robot can successfully:

build a map using SLAM

save and load the static map

localize itself using AMCL

navigate to a goal in RViz

avoid obstacles using costmaps

🧠 Navigation Pipeline

The navigation system follows the standard Nav2 architecture:

RViz Goal
→ bt_navigator
→ planner_server
→ global path
→ controller_server
→ /cmd_vel
→ robot motion

Supporting modules:
map
→ AMCL localization
→ costmap updates
→ obstacle-aware navigation

Core concept:

planner decides where to go
controller decides how to move
AMCL decides where the robot is
costmap decides which space is safe
🗺️ Learning Roadmap
Stage 1 (Completed)

ROS2 fundamentals

workspace setup

topic / node communication

TF understanding

Gazebo simulation

SLAM mapping

map save & load

AMCL localization

Nav2 navigation

navigation architecture understanding

Stage 2 (Next)

Focus on deeper system understanding:

Nav2 parameter system

costmap layer structure

controller algorithms

navigation tuning

navigation debugging

Stage 3 (Planned)

Engineering improvements:

rosbag debugging

parameter tuning experiments

navigation testing scenarios

performance analysis

📂 Project Structure
ros2-nav-learning/
│
├── docs/           
│   Navigation concepts and explanations
│
├── logs/           
│   Daily development logs
│
├── screenshots/    
│   Experiment results and verification
│
├── workspace/      
│   ROS2 packages and experiments
│
├── scripts/        
│   Launch helper scripts for starting the navigation system
│
└── README.md
## Key Documentation

Core concept explanations are located in:

docs/

Important documents:

- ROS2 Basics
- TF Tree
- Map → Odom → Base Link relationship
- SLAM Mapping
- AMCL Localization
- Nav2 Navigation Pipeline
- Costmap / Planner / Controller architecture
📈 Learning Focus

This project emphasizes:

robotics system architecture

ROS2 debugging capability

engineering documentation

reproducible robotics environments

autonomous navigation systems

📌 Notes

Daily development progress is recorded in:

logs/

Concept explanations and learning notes are documented in:

docs/

This repository evolves continuously as the navigation system is built, analyzed, and improved.

🚀 Stage 1 Milestone

The project has successfully reached the first milestone:

A fully working ROS2 navigation stack in simulation.

Future work will focus on deeper system understanding, parameter tuning, and robotics engineering practices.

## 🏆 Stage 1 Milestone Reached (2026-03-13)

A fully functional ROS2 navigation pipeline has been successfully established in a simulated environment.

### Core Achievements:
- **Simulation**: Stable Gazebo + TurtleBot3 control loop established.
- **Mapping**: Completed SLAM using `slam_toolbox` and verified occupancy grid consistency.
- **Navigation**: Integrated AMCL and Nav2, achieving stable goal-based autonomous movement.
- **Architecture**: Deep understanding of Nav2's internal mechanisms, including Behavior Trees and Lifecycle management.

This milestone marks the transition from basic system setup to advanced parameter tuning and engineering practices.