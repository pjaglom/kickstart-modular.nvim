-- [[ Custom setting options ]]

-- Primeagen Recommendations
-- Let undotree save undo history persistently
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Incremental search
vim.opt.incsearch = true

-- Scroll settings
vim.opt.scrolloff = 8

-- Reduce update time for better responsiveness
vim.opt.updatetime = 50

-- Highlight the 80th column
vim.opt.colorcolumn = "80"