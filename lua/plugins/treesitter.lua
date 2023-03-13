local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
    },
    opts = {
        highlight = {
            enable = true,
        },
        autopairs = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        ensure_installed = {"help", "javascript", "typescript", "json", "html", "lua", "rust", "python"},
        sync_install = false,
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

return M