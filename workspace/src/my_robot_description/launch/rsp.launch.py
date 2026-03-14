import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node

def generate_launch_description():

    # 1. Specify the name of the package and the path to the urdf file
    pkg_name = 'my_robot_description'
    urdf_file = 'my_robot.urdf'

    # 2. Get the full path to the urdf file
    pkg_share = get_package_share_directory(pkg_name)
    urdf_path = os.path.join(pkg_share, 'urdf', urdf_file)

    # 3. Read the urdf file content
    with open(urdf_path, 'r') as infp:
        robot_description_raw = infp.read()

    # 4. Configure the node
    node_robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        parameters=[{'robot_description': robot_description_raw}]
    )

    # 5. Launch it!
    return LaunchDescription([
        node_robot_state_publisher
    ])