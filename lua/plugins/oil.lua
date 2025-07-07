return {
   'stevearc/oil.nvim',
   opts = {},
   -- Optional dependencies
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("oil").setup {
         columns = { "icon" },
         keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
         },
         view_options = {
            show_hidden = true,
         }
      }

      -- Open parent dir in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
   end
}
