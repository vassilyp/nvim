local dap = require('dap')

dap.adapters = {
    ['pwa-node'] = {
        type = 'server',
        host = '::1',
        port = '${port}',
        executable = {
            command = 'js-debug-adapter',
            args = {
                '${port}',
            },
        },
    },
}

dap.configurations["typescript"] = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach to process ID",
        cwd = "${workspaceFolder}",
    },
}
