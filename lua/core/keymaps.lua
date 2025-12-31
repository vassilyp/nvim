-- This is for shortcuts to do things quicker! (Not plugin specific)

local map = vim.keymap.set

-- Clear highlight with Escape in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.get_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.get_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Quickfix list" })

-- Resize windows easier
map("n", "<C-Up>", "<C-w>+2", { desc = "Increase window height" })
map("n", "<C-Down>", "<C-w>-2", { desc = "Decrease window height" })

-- Exit terminal mode easier
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Easier split navigation and control
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move highlighted text
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text up with J" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text down with K" })

map("n", "J", "mzJ`z", { desc = "Staple lines together" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll a half-page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll a half-page up" })

-- Keep search result in middle when going to next/prev
map("n", "n", "nzzzv", { desc = "Search next" })
map("n", "N", "Nzzzv", { desc = "Search prev" })

-- Keep paste buffer the same when pasting over highlighted text
map("x", "<leader>p", '"_dP', { desc = "Paste over selected text" })

-- How to copy/paste using system clipboard
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy selected text to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
-- Similar, except cut/paste
map("n", "<leader>d", '"_d', { desc = "Cut into system clipboard" })
map("v", "<leader>d", '"_d', { desc = "Cut selected text into system clipboard" })

-- Source the file
map("n", "<leader>x", "<cmd>source %<CR>", { desc = "Source the current file" })

-- Insert options
map("n", "<leader>id", "<cmd>pu=strftime('%c')<CR>", { desc = "Insert the current date" })

map("n", "<leader>cl", "<cmd>LspInfo<CR>", { desc = "Open LspInfo" })
