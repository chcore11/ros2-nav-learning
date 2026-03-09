# TF Tree

TF Tree(TransForm Tree) discribes the position relationships between different coordinate frames in a robot system.It helps the robot understand where it is,how it moves,and how sensor data relates to the robot body and the map.

## What is a TF Tree

A TF Tree is a tree-like structure that connects different frames in the robot system

Common frames:
 - map
 - odom
 - base_link
 - laser

## Why It Matters

TF Tree is important because differernt parts of the robot system use differenrt frames to work.