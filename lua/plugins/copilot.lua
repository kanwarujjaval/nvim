local M = {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    opts = {
        ft_disable = { "markdown", "terraform", "cpp" },
    },
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
            -- suggestion = {
                -- enabled = true,
                -- auto_trigger = true,
                -- keymap = {
                --     accept = "<M-l>",
                --     accept_word = false,
                --     accept_line = false,
                --     next = "<M-]>",
                --     prev = "<M-[>",
                --     dismiss = "<C-]>",
                -- },
            -- },
        })
    end,
}

return M
