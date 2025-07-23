return {
   { -- Highlight, edit, and navigate code
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
         ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
         auto_install = true,
         ignore_install = { "sql" },
         highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { "ruby" },
         },
         indent = { enable = true, disable = { "ruby" } },
      },
      config = function(_, opts)
         -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

         require("nvim-treesitter.configs").setup(opts, {
            indent = {
               disable = 'cpp',
            }
         })
      end,
   },
}
