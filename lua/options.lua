-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- <TAB> mapping option for Copilot. Source: https://github.com/orgs/community/discussions/52918
vim.g.copilot_assume_mapped = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Prevent bad habits like using arrow keys for movement. Adapted from 
-- https://missing.csail.mit.edu/2020/editors/
-- Normal mode:
vim.api.nvim_set_keymap('n', '<Left>', ':echo "Use h"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', ':echo "Use l"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', ':echo "Use k"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':echo "Use j"<CR>', { noremap = true, silent = true })
-- Insert mode:
vim.api.nvim_set_keymap('i', '<Left>', '<ESC>:echo "Use h"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<ESC>:echo "Use l"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '<ESC>:echo "Use k"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<ESC>:echo "Use j"<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
