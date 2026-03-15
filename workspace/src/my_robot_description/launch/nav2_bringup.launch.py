from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, DeclareLaunchArgument
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from ament_index_python.packages import get_package_share_directory
import os


def generate_launch_description():
    my_robot_pkg = get_package_share_directory('my_robot_description')
    nav2_bringup_pkg = get_package_share_directory('nav2_bringup')

    map_file = '/home/chung/ros2-nav-learning/maps/turtlebot3_world_map.yaml'
    params_file = os.path.join(my_robot_pkg, 'config', 'nav2_params.yaml')

    use_sim_time = LaunchConfiguration('use_sim_time')

    return LaunchDescription([
        DeclareLaunchArgument(
            'use_sim_time',
            default_value='true',
            description='Use simulation time'
        ),

        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(nav2_bringup_pkg, 'launch', 'bringup_launch.py')
            ),
            launch_arguments={
                'map': map_file,
                'use_sim_time': use_sim_time,
                'params_file': params_file
            }.items()
        )
    ])
