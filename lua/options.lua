-- disable compatibility with Vim
vim.opt.compatible = false

-- enable true color support
vim.opt.termguicolors = true

-- set the backspace key to work properly
vim.opt.backspace = {"indent", "eol", "start"}

-- set the number of spaces for a tab
vim.opt.tabstop = 2

-- set the number of spaces to use for indentation
vim.opt.shiftwidth = 2

-- set the behavior of the tab key
vim.opt.expandtab = true

-- enable mouse support
vim.opt.mouse = "a"

-- enable line numbers
vim.opt.number = true

-- enable syntax highlighting
vim.opt.syntax = "on"

-- enable incremental searching
vim.opt.incsearch = true

-- enable searching case-insensitively
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable auto indent
vim.opt.autoindent = true

-- enable relative line numbers
vim.opt.relativenumber = false

vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.timeoutlen = 500
