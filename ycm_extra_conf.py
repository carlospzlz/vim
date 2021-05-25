def Settings(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++17',
            '-x', 'c++',
            '-isystem', '/usr/include/c++/11.1.0',
            '-isystem', '/usr/local/include',
            '-isystem', '/usr/include',
            '-isystem', '/usr/include/opencv4',
            '-I', 'include',
            '-I', '/opt/ros/foxy/include',
            '-I', '/usr/local/include/slamcore',
            '-I', '/home/infcpl00/dev/slamcore_ros2/src/slamcore_slam/include',
            ]
    }
