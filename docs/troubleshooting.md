# 🛠️ Troubleshooting Guide

This document records the issues encountered during the development of the ROS2 Navigation project and their solutions.

## 01. Map Server Failed to Load Map
**Date:** 2026-03-05 (Day 7)

### Issue Description
When launching the Nav2 stack, RViz2 showed a `Frame [map] does not exist` error, and the occupancy grid map was not displayed.

### Root Cause
The `map_server` failed to load the map because the `image:` path in the `turtlebot3_world_map.yaml` file was incorrect.

### Solution
Corrected the `image:` entry in the `.yaml` file to point to the actual `.pgm` file name and restarted the stack.

---

## 02. VS Code Server Download Failure (Proxy Error)
**Date:** 2026-03-13 (Day 15)

### Issue Description
Running `code .` in WSL2 failed with `Error parsing proxy URL http://:7897: Invalid host name`.

### Root Cause
The environment variables `$http_proxy` and `$https_proxy` were incorrectly set to `http://:7897` (missing the IP address). This prevented VS Code from downloading its required server components.

### Solution
1. Temporarily used `unset http_proxy` and `unset https_proxy` to bypass the faulty settings.
2. Successfully launched VS Code using direct connection.