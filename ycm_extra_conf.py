def FlagsForFile(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-x', 'c++',
            '-isystem', '/usr/include/c++/4.8.5',
            '-isystem', '/usr/include/c++/4.8.5/x86_64-redhat-linux',
            '-isystem', '/usr/include/c++/4.8.5/backward',
            '-isystem', '/usr/local/include',
            '-isystem', '/usr/include',
            ]
    }
