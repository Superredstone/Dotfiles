-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<A-l>", ":bnext<CR>", opts)             -- Next buffer
map("n", "<A-h>", ":bprevious<CR>", opts)         -- Last buffer
map("n", "<C-s>", ":w<CR>", opts)                 -- Save
map("n", "<C-q>", ":q<CR>", opts)                 -- Quit and save
map("n", "q", ":bdelete<CR>", opts)               -- Close current buffer
map("n", "<Space>e", ":NvimTreeToggle<CR>", opts) -- Open file tree
map("n", "<C-c>", ":CommentToggle<CR>", opts)     -- Toggle comment n mode
map("v", "<C-c>", ":CommentToggle<CR>", opts)     -- Toggle comment v mode
map("n", "<Space>q", ":bdelete<CR>", opts)        -- Close buffer
map("n", "<S-q>", ":bdelete!<CR>", opts)          -- Close buffer!

-- Move between windows
map("n", "<Space>wl", ":wincmd l<CR>", opts)
map("n", "<Space>wh", ":wincmd h<CR>", opts)
map("n", "<Space>wk", ":wincmd k<CR>", opts)
map("n", "<Space>wj", ":wincmd j<CR>", opts)

-- Find files
map("n", "<Space>f", ":Telescope find_files<CR>", opts)
map("n", "<Space>g", ":Telescope live_grep<CR>", opts)

-- Movement
map("n", "gl", "$", opts)
map("n", "gh", "^", opts)
map("v", "gl", "$", opts)
map("v", "gh", "^", opts)

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>")
map("n", "<Space>t", ":ToggleTerm direction=float<CR>")

-- LSP
map("n", "<Space>k", function() vim.lsp.buf.hover() end, opts)
map("n", "<Space>r", function() vim.lsp.buf.rename() end, opts)
map("n", "<Space>a", function() vim.lsp.buf.code_action() end, opts)

-- Change colorscheme
map("n", "<C-t>", function() vim.cmd([[Themery]]) end, opts)
