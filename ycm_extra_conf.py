def FlagsForFile(filename, **kwargs):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-x', 'c++',
            '-isystem', '/usr/include/c++/8.2.1',
            '-isystem', '/usr/local/include',
            '-isystem', '/usr/include',
            '-I', 'include',
            ]
    }
