local M = {
    "nvim-tree/nvim-web-devicons",
    event = "BufReadPre", 
    config = function()
        require('nvim-web-devicons').setup {
            default = true;
        }
    end,
}

return M
