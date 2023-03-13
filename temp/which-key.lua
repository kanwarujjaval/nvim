local M = {
    "folke/which-key.nvim",
    event = "BufRead",
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
            },
            window = {
                border = "single",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 2, 2, 2, 2 },
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
            },
            ignore_missing = false,
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
            triggers = "auto",
            show_help = true,
            triggers_blacklist = {
                i = { "j", "k" },
            },
        })
    end,
}

return M