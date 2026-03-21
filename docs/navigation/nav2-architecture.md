# Nav2 System Architecture

This document explains how the Nav2 system works as a complete navigation pipeline.

---

## 1. High-Level Pipeline

RViz Goal  
→ bt_navigator  
→ planner_server  
→ controller_server  
→ /cmd_vel  
→ Robot Motion  

This is the main execution flow of navigation.

---

## 2. Three Core Subsystems (Key Insight 🔥)

Nav2 can be understood as three interacting subsystems:

### 1. Localization (Where am I?)

AMCL estimates the robot pose using:

- map
- scan
- odom

Output:

robot pose in map frame  
map → odom transform

Without localization, navigation cannot work.

---

### 2. Planning (Where should I go?)

planner_server:

- uses global_costmap
- computes a collision-free path

Output:

global path

---

### 3. Control (How do I move?)

controller_server:

- uses local_costmap
- follows the global path
- generates velocity commands

Output:

/cmd_vel

---

## 3. Perception Flow

Sensors → costmaps → planner/controller

- scan → obstacle detection
- costmap → environment representation

Global costmap → long-term planning  
Local costmap → real-time obstacle avoidance  

---

## 4. Behavior Tree (System Coordinator)

bt_navigator coordinates the entire navigation process.

Main steps:

- ComputePathToPose
- FollowPath
- Recovery behaviors

Recovery actions include:

- clearing costmap
- rotating
- backing up

---

## 5. Full System View

Navigation is not a single module.

It is a system composed of:

- localization (AMCL)
- environment modeling (costmaps)
- planning (planner_server)
- control (controller_server)
- coordination (bt_navigator)

---

## 6. Core Understanding

Navigation only works when:

- robot knows where it is (localization)
- system knows where it can go (costmap)
- planner computes a valid path
- controller executes motion safely

---

## Conclusion

Nav2 is a modular system where each component has a clear role:

- AMCL → pose estimation  
- planner → path generation  
- controller → motion execution  
- costmap → environment understanding  
- behavior tree → system coordination  

Together, they enable autonomous navigation.