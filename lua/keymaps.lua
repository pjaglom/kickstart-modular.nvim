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

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ The Primeagen Recs - https://github.com/ThePrimeagen/init.lua/ ]]
-- Remap to open netrw file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Open netrw' })

-- allow you to move text up and down when selected in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' })

-- keep cursor in same place when bringing text up with J
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Bring text up to same line' })

-- keep cursor in middle of screen when scrolling with C-u and C-d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in middle of screen when searching for text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when pasting over a highlight, keeps the original cut text in the register 
-- instead of replacing with the deleted highlighted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard (so can keep them separate but still access)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register (so it isn't available for pasting)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- not sure what 'Q' does, but apparently it's bad, so this disables it
vim.keymap.set("n", "Q", "<nop>")

-- not totally sure how to use this one, but allows you to switch projects with
-- C-f, find new project and open it, then to come back, use C-a, then L
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- request formatting for the current buffer from the language server associated with the current filetype
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation - allows you to quickly move between lsp/linter-identified errors
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- bring up substitution command to replace current text under cursor with 
-- arbitrary text you input - could be awesome for refactoring names
vim.keymap.set("n", "<leader>i", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current buffer executable (chmod +x)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim: ts=2 sts=2 sw=2 et
