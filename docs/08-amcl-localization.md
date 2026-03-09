# AMCL Localization

AMCL(Adaptive Monta Calo Localization) is used to estimate the robot's position on a known map.

After a map is created using SLAM and loaded by the map server,AMCL helps the robot determine where it is on tha map.

## What AMCL does

AMCL estimates the robot's pose on the map.

By comparing the laser data with the map,AMCL can estimate the robot's current position and orientation.

## How It Works

AMCL uses a particle filter method.

As the robot moves and receives sensor data:

- particle that match sensor data kept
- particle that do not match are removed

Over time,the particle converge to the robot's true position.
