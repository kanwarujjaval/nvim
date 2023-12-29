local M = {
    "github/copilot.vim",
    lazy = false,
    -- add keymaps
    config = function()
        local map = vim.api.nvim_set_keymap
        local options = { noremap = true, silent = true }
        -- Pressing <Tab> autocompletes suggestions
        -- map('i', '<Tab>', '<Plug>(copilot-next-suggestion)', options)
        -- Keymap for getting complete suggestions
        -- map('n', '<leader>cs', '<Plug>(copilot-suggest-line)', options)
    end,
}

return M

