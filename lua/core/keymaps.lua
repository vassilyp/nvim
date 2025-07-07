-- This is for shortcuts to do things quicker! (Not plugin specific)

-- Clear highlight with Escape in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Easier split navigation and control
vim.keymap.set('n', '<leader>vv', '<C-w>L', { desc = 'Move split from horizontal to vertical' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move highlighted text
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text up with J" })
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down with K" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Staple lines together" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll a half-page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll a half-page up" })

-- Keep search result in middle when going to next/prev
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev" })

-- Keep paste buffer the same when pasting over highlighted text
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste over selected text" })

-- How to copy/paste using system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy selected text to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Copy line to system clipboard" })

-- Similar, except cut/paste
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Cut into system clipboard" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Cut selected text into system clipboard" })

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source the current file " })
