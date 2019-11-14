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
            '-I', 'include',
            ]
    }
