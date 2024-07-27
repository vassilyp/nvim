return {
   {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      dependencies = {
         { 'williamboman/mason.nvim' },
         { 'williamboman/mason-lspconfig.nvim' },

         { 'neovim/nvim-lspconfig' },

         { 'hrsh7th/cmp-nvim-lsp' },
         { 'hrsh7th/nvim-cmp' },
         { 'hrsh7th/cmp-buffer' },
         { 'hrsh7th/cmp-nvim-lsp-signature-help' },
         { 'L3MON4D3/LuaSnip' },
         { 'saadparwaiz1/cmp_luasnip' },
         { "rafamadriz/friendly-snippets" },
      },
      config = function()
         local lsp_zero = require('lsp-zero')

         lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            local map = function(keys, func, desc)
               vim.keymap.set('n', keys, func,
                  { buffer = bufnr, desc = 'LSP: ' .. desc })
            end

            -- Jump to the definition of the word under your cursor.
            --  To jump back, press <C-t>.
            map('gd', require('telescope.builtin').lsp_definitions,
               '[G]oto [D]efinition')

            -- Find references for the word under your cursor.
            map('gr', require('telescope.builtin').lsp_references,
               '[G]oto [R]eferences')

            -- Jump to the implementation of the word under your cursor.
            map('gI', require('telescope.builtin').lsp_implementations,
               '[G]oto [I]mplementation')

            -- Jump to the type of the word under your cursor.
            map('<leader>D',
               require('telescope.builtin').lsp_type_definitions,
               'Type [D]efinition')

            map('<leader>ds',
               require('telescope.builtin').lsp_document_symbols,
               '[D]ocument [S]ymbols')

            map('<leader>ws',
               require('telescope.builtin').lsp_dynamic_workspace_symbols,
               '[W]orkspace [S]ymbols')

            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            -- map('<leader>f', vim.lsp.buf.format, '[F]ormat code')

            -- Autoformatting on save
            lsp_zero.buffer_autoformat()
         end)

         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = vim.tbl_deep_extend("force", capabilities,
            require("cmp_nvim_lsp").default_capabilities())

         -- NOTE: put server configuration here!
         local servers = {
            yamlls = {},
            gopls = {},
            lua_ls = {
               settings = {
                  Lua = {
                     completion = {
                        callSnippet = 'Replace',
                     },
                  },
               },
            }
         }
         require('mason').setup({})
         require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
               function(server_name)
                  local server = servers[server_name] or {}
                  server.capabilities = vim.tbl_deep_extend("force", {},
                     capabilities, server.capabilities or {})
                  require('lspconfig')[server_name].setup(server)
               end,
            },
         })

         local cmp = require('cmp')
         local cmp_format = require('lsp-zero').cmp_format({ details = true })
         local cmp_action = require('lsp-zero').cmp_action()
         local luasnip = require('luasnip')

         -- If you want insert `()` after select function or method item
         local cmp_autopairs = require('nvim-autopairs.completion.cmp')
         cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
         )

         luasnip.config.setup({})
         require('luasnip.loaders.from_vscode').lazy_load()

         cmp.setup({
            sources = {
               { name = 'nvim_lsp' },
               { name = 'buffer' },
               { name = 'luasnip' },
               { name = 'nvim_lsp_signature_help' },
            },
            formatting = cmp_format,

            mapping = cmp.mapping.preset.insert({
               -- confirm completion
               ['<C-y>'] = cmp.mapping.confirm({ select = true }),
               ['<C-e>'] = cmp.mapping.abort(),

               ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'insert' }),
               ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'insert' }),

               -- scroll up and down the documentation window
               ['<C-u>'] = cmp.mapping.scroll_docs(-4),
               ['<C-d>'] = cmp.mapping.scroll_docs(4),

               -- Move through snippet sections
               ['<C-l>'] = cmp_action.luasnip_jump_forward(),
               ['<C-h>'] = cmp_action.luasnip_jump_backward(),
            }),

            snippet = {
               expand = function(args)
                  luasnip.lsp_expand(args.body)
               end,
            },

            preselect = 'item',
            completion = {
               completeopt = 'menu,menuone,noinsert'
            },
            enabled = function()
               -- disable completion in comments
               local context = require 'cmp.config.context'
               if vim.api.nvim_get_mode().mode == 'c' then
                  return true
               else
                  return not context.in_treesitter_capture("comment")
                      and not context.in_syntax_group("Comment")
               end
            end,
         })
      end
   },
}
