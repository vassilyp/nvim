return {
    'mfussenegger/nvim-dap',
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require 'dap'
        local ui = require 'dapui'

        require("dapui").setup()

        vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<leader>bs", dap.run_to_cursor, { desc = "Run to cursor" })

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end, { desc = "Eval variable under cursor" })

        vim.keymap.set("n", "<leader>bc", dap.continue, { desc = "Debug continue" })
        vim.keymap.set("n", "<leader>bi", dap.step_into, { desc = "Debug step into" })
        vim.keymap.set("n", "<leader>bo", dap.step_over, { desc = "Debug step over" })
        vim.keymap.set("n", "<leader>bu", dap.step_out, { desc = "Debug step out" })
        vim.keymap.set("n", "<leader>bk", dap.step_back, { desc = "Debug step back" })
        vim.keymap.set("n", "<leader>br", dap.restart, { desc = "Debug step restart" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end
}
