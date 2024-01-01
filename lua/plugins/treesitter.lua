local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "javascript", "vim", "vimdoc" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

return M
