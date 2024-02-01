local M = {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-web-devicons" },
	lazy = false,
	config = function()
		local map = vim.api.nvim_set_keymap
		local options = { noremap = true, silent = true }
		map("n", "<leader>ff", ":Telescope file_browser<CR>", options)
		map("n", "<leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", options)
	end,
}

return M
