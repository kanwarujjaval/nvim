-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- exit insert mode with jk
vim.keymap.set('i', 'jk', '<Esc>')

-- save file with <leader>w
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>') 
-- vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
-- vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
-- vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
-- vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
