return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require "dap"
    local ui = require "dapui"

    ui.setup()
    require("dap-go").setup()
    require("nvim-dap-virtual-text").setup()
    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = '/usr/bin/python3',
      },
    }

    vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
    vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Run to cursor" })

    -- Eval var under cursor
    vim.keymap.set("n", "<space>?", function()
      require("dapui").eval(nil, { enter = true })
    end, { desc = "DAP: evaluate var" })

    vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP: continue" })
    vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: step into" })
    vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP: step over" })
    vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: step out" })
    vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP: step back" })
    vim.keymap.set("n", "<F13>", dap.restart, { desc = "DAP: restart" })

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
