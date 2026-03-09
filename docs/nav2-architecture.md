Nav2 Architecture
Full Navigation Flow
RViz Goal
   ↓
bt_navigator
   ↓
planner_server
   ↓
global path
   ↓
controller_server
   ↓
/cmd_vel
   ↓
Robot Motion in Gazebo
Supporting System
map
 └─→ map_server
       └─→ global_costmap

/scan
 ├─→ AMCL
 ├─→ local_costmap
 └─→ global_costmap

/odom
 └─→ AMCL
Localization and Costmaps
map + /scan + /odom
        ↓
       AMCL
        ↓
robot pose in map
global_costmap
= static_layer
+ obstacle_layer
+ voxel_layer
+ inflation_layer
local_costmap
= obstacle_layer
+ voxel_layer
+ inflation_layer
Planner and Controller Roles
planner_server
→ decides where to go
→ computes global path
controller_server
→ decides how to move now
→ samples trajectories
→ scores trajectories
→ publishes /cmd_vel
Core Logic
planner decides where to go
controller decides how to move
AMCL decides where the robot is
costmap decides which space is safe
Real-Time Obstacle Reaction
LaserScan (/scan)
   ↓
costmap update
   ↓
controller reacts
   ↓
new /cmd_vel
   ↓
robot changes motion
Full System View
                 +------------------+
                 |    RViz Goal     |
                 +------------------+
                           ↓
                 +------------------+
                 |   bt_navigator   |
                 +------------------+
                           ↓
                 +------------------+
                 | planner_server   |
                 +------------------+
                           ↓
                     global path
                           ↓
                 +------------------+
                 | controller_server|
                 +------------------+
                           ↓
                        /cmd_vel
                           ↓
                 +------------------+
                 |   Robot Motion    |
                 |    in Gazebo      |
                 +------------------+

Supporting modules:
  map ----→ map_server ----→ global_costmap
  /scan ---→ AMCL ---------→ robot pose
  /scan ---→ local_costmap
  /odom ---→ AMCL