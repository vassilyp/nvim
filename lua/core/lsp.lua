-- LSP (Work In Progress)
--
-- :help lsp
--
-- Current functionality:
-- CTRL+] to go to definition (CTRL+T to go back)
-- K for hover signature
-- grn for LSP rename
-- gra for LSP code action
-- grr for LSP references (?)
-- gri for LSP implementation (?)
-- gO for LSP document symbol (?)
-- CTRL-S for signature help while in insert mode
--
-- <leader>e for float error (from keymaps)
-- <leader>q for quickfix list (from keymaps)

vim.lsp.enable("lua_ls")
