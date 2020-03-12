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
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Geolib3/PluginApis/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/PLUGINS/Viewers/HydraViewer/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/PLUGIN_APIS/include',
            '-I', '/home/cpl/.conan/data/OpenEXR/2.2.0/foundry/stable/package/de9c231f84c85def9df09875e1785a1319fa8cb6/include/OpenEXR',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/PLUGINS/ViewerPlugins/WireframeSelection/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/PLUGINS/ViewerPlugins/Snapping/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/PLUGINS/ViewerPlugins/HydraSelection/include',
            '-I', '/workspace/carlos.perezlopez/dev/katana-3.6/Apps/Katana/FNHDBRIDGE/include',
            ]
    }
