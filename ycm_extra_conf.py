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
            '-I', 'include',
            '-I', '/usr/local/USD/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.2/Apps/Katana/PLUGINS/Viewers/HydraViewer/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.2/Apps/Katana/PLUGIN_APIS/include',
            ]
    }
