def FlagsForFile(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-x', 'c++',
            '-isystem', '/usr/include/c++/9.2.0',
            '-isystem', '/usr/local/include',
            '-isystem', '/usr/include',
            '-isystem', '/usr/include/opencv4/opencv2/opencv.hpp',
            '-I', 'include',
            '-I', '/home/infcpl00/clones/USD/install/include',
            '-I', '/home/infcpl00/foundry/Katana3.5v1.010022b/plugin_apis/include',
            '-I', '/home/infcpl00/dev/hydra-selection/include',
            ]
    }
