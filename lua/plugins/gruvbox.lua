local M = {
    "ellisonleao/gruvbox.nvim", 
    priority = 1000,
    lazy = false,
    name = "gruvbox",
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            transparent_mode = true,
            contrast = "hard",
            bold = false,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
                folds = true,
            },
        })
        vim.cmd.colorscheme "gruvbox"
    end
}

return M