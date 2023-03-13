-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- exit insert mode with jk
vim.keymap.set('i', 'jk', '<Esc>')

-- save file with <leader>w
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>') 

-- define key mappings
-- move to left window
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
 -- move to bottom window
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
 -- move to top window
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
 -- move to right window
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })