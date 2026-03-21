# Nav2 System Architecture

This document explains how Nav2 works as a complete navigation system.

Rather than viewing Nav2 as a single module, it should be understood as a coordinated pipeline that transforms a user-defined goal into robot motion.

---

## 1. What Nav2 Does

Nav2 takes a navigation goal from RViz and converts it into motion commands that drive the robot toward the target safely.

In simple terms:

RViz Goal  
→ system planning and decision-making  
→ motion control  
→ robot movement

Its job is not only to move the robot, but to make sure the robot:
- knows where it is
- knows where it can go
- knows how to move safely

---

## 2. High-Level Pipeline

The main execution pipeline is:

RViz Goal  
→ bt_navigator  
→ planner_server  
→ controller_server  
→ /cmd_vel  
→ Robot Motion

This is the control path of the system.

A goal is first received by `bt_navigator`, which coordinates the navigation task.
It then asks the planner to compute a path, asks the controller to follow that path, and finally produces velocity commands through `/cmd_vel`.

---

## 3. Three Core Questions in Navigation

A navigation system must answer three fundamental questions:

1. Where am I?
2. Where should I go?
3. How should I move?

Nav2 answers these questions through three subsystems:

- Localization
- Planning
- Control

This is the core idea of the architecture.

---

## 4. Localization: Where am I?

Localization is handled by AMCL.

AMCL estimates the robot pose using:
- map
- scan
- odom

Its output is:
- robot pose in the map frame
- the `map → odom` transform

Why is this necessary?

Because the robot cannot navigate unless it knows its current position.
Odometry alone is continuous but drifts over time.
AMCL corrects that drift by matching laser scan data against the known map.

So in Nav2, localization provides the answer to:

**“Where is the robot right now?”**

Without localization, planning and control would not be reliable.

---

## 5. Planning: Where should I go?

Planning is handled by `planner_server`.

The planner uses:
- the current robot pose
- the goal pose
- the global costmap

Its output is:
- a global path

This path is not just a straight line.
It is a collision-aware route computed over the map and obstacle information.

The planner answers:

**“What is a safe path from the current position to the goal?”**

This is a global decision.
It focuses on the overall route, not the robot’s exact wheel-level motion.

---

## 6. Control: How should I move?

Control is handled by `controller_server`.

The controller uses:
- the global path
- the current robot pose
- the local costmap

Its output is:
- `/cmd_vel`

The controller does not simply “follow a line”.
Instead, it continuously decides how the robot should move at each moment.

For example, it may:
- adjust heading
- slow down near the goal
- avoid nearby obstacles
- correct path deviation

The controller answers:

**“What should the robot do right now in order to follow the path safely?”**

This is why the controller is different from the planner:
- planner = global route
- controller = local execution

---

## 7. Costmaps: Where can I move safely?

Costmaps represent the environment in a form that planning and control can use.

They are built from sensor data and map information.

Nav2 commonly uses two types of costmaps:

### Global Costmap
Used by the planner.

It represents the larger environment and supports long-range path planning.

### Local Costmap
Used by the controller.

It represents nearby obstacles and supports real-time obstacle avoidance.

Why are costmaps important?

Because navigation is not only about knowing the goal.
The system must also know which areas are free, occupied, or risky.

Costmaps provide the answer to:

**“Which space is safe for the robot to use?”**

---

## 8. Behavior Tree: Who coordinates everything?

`bt_navigator` is the coordinator of the entire Nav2 system.

It uses a Behavior Tree to organize the navigation process.

Typical steps include:
- ComputePathToPose
- FollowPath
- Recovery behaviors

Recovery behaviors may include:
- clearing costmaps
- rotating
- backing up

Why is this needed?

Because navigation is not always successful on the first try.
The system needs a structured way to react to failure, retry actions, and recover from problems.

So the Behavior Tree is not just a “launcher”.
It is the decision-making framework that coordinates the whole task.

---

## 9. Three System Flows

Nav2 can also be understood through three interacting flows.

### 1. Control Flow
RViz Goal  
→ bt_navigator  
→ planner_server  
→ controller_server  
→ /cmd_vel  
→ Robot Motion

This flow explains how a user goal becomes robot movement.

### 2. Localization Flow
map + scan + odom  
→ AMCL  
→ robot pose in map frame  
→ `map → odom`

This flow explains how the robot knows where it is.

### 3. Perception Flow
scan / map  
→ global costmap / local costmap  
→ planner / controller

This flow explains how the system understands free space, obstacles, and safe movement regions.

These three flows work together.
Navigation succeeds only when all three are functioning correctly.

---

## 10. Why This Architecture Is Split into Modules

Nav2 is divided into localization, planning, control, costmaps, and coordination for a reason.

This separation makes the system:
- easier to understand
- easier to debug
- easier to replace or extend
- more robust in complex environments

For example:
- localization focuses only on pose estimation
- planning focuses only on route generation
- control focuses only on motion execution

This is an example of modular system design.

Instead of one large monolithic navigation block, Nav2 uses specialized components with clear responsibilities.

---

## 11. Core Understanding

Nav2 works only when all of the following are available:

- the robot knows where it is
- the system knows where it can move
- the planner can compute a valid path
- the controller can execute motion safely
- the Behavior Tree can coordinate the full process

So Nav2 should not be understood as a single algorithm.

It is a coordinated navigation system built from multiple interacting subsystems.

---

## Conclusion

Nav2 transforms a goal into safe robot motion through a modular architecture.

Its core logic can be summarized as:

- Localization answers: **Where am I?**
- Planning answers: **Where should I go?**
- Control answers: **How should I move?**
- Costmaps answer: **Where can I move safely?**
- Behavior Tree answers: **How are all these steps coordinated?**

Together, these components enable autonomous navigation.