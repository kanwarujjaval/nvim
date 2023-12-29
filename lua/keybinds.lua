-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- exit insert mode with jk
vim.keymap.set('i', 'jk', '<Esc>')

-- save file with <leader>w
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>') 
