def FlagsForFile(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-x', 'c++',
            '-isystem', '/usr/include/c++/10.1.0',
            '-isystem', '/usr/local/include',
            '-isystem', '/usr/include',
            '-isystem', '/usr/include/opencv4',
            '-I', 'include',
            '-I', '/usr/local/USD/include/',
            '-I', '/home/infcpl00/foundry/Katana3.5v1.010022b/plugin_apis/include',
            '-I', '/home/infcpl00/dev/hydra-selection/include',
            ]
    }
