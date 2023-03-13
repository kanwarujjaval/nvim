-- local M = {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha",
--             transparent_background = true,
--         })
--     end,
-- }

-- local M = {
--     "arturgoms/moonbow.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("moonbow").setup({
--             transparent_mode = true,
--         })
--     end,
-- }

local M = {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            terminal_colors = true,
            devicons = true,
            filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
            -- background_clear = {
            --     -- "float_win",
            --     "toggleterm",
            --     "telescope",
            --     "which-key",
            --     "renamer"
            -- },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
            -- plugins = {
            --     bufferline = {
            --         underline_selected = false,
            --         underline_visible = false,
            --     },
            --     indent_blankline = {
            --         context_highlight = "default", -- default | pro
            --         context_start_underline = false,
            --     },
            -- },
        })
    end,
}

return M