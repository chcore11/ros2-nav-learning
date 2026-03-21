# URDF Core Concepts

## 1. Link vs. Joint
- **Link**: Represents the physical body or parts of the robot (e.g., chassis, wheels).
- **Joint**: Defines the kinematic relationship and connection between two links.

## 2. Basic Frames
- **base_footprint**: A virtual frame representing the robot's projection on the ground.
- **base_link**: The main coordinate frame attached to the robot's rigid body.

## 3. Visual vs. Collision
- **Visual**: Defines how the robot looks in RViz (geometry, materials).
- **Collision**: Defines the simplified shapes for physics calculation in Gazebo.

## URDF Definition of Done (DoD)
A URDF model is considered "Simulation-Ready" when it meets the following criteria:
1. **Kinematic Consistency**: All links are connected via appropriate joints with correct TF offsets.
2. **Physical Accuracy**: Every link includes `<inertial>` tags with realistic mass and principal moments of inertia.
3. **Collision Safety**: Simplified collision boxes/cylinders are defined to optimize physics engine performance.
4. **Hardware Abstraction**: Gazebo plugins (e.g., `libgazebo_ros_diff_drive.so`) are integrated to link ROS2 topics to simulated actuators.
5. **Sensor Parity**: The model includes functional plugins for LiDAR, IMU, and other required sensors.