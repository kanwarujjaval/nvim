local M = {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{ "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
		{ "<C-M-f>", "<cmd>lua require('telescope.builtin').git_files()<cr>" }, -- Find files in git
		{ "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
		{ "<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },

		{
			"<leader>ff",
			"<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--iglob', '!{.git,node_modules}/*' }})<cr>",
		},
		{ "<leader>fa", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
		{ "<leader>fc", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
		{ "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" }, -- Find files in git
		{ "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<cr>" },
		{ "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
		local fb_actions = require("telescope._extensions.file_browser.actions")
		return {
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				mappings = { i = { ["<esc>"] = actions.close } },
				file_ignore_patterns = {
					"node_modules",
					-- ".git",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					theme.get_dropdown({}),
				},
				file_browser = {
					-- theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					cwd_to_path = false,
					grouped = false,
					files = true,
					add_dirs = true,
					depth = 5,
					auto_depth = false,
					select_buffer = false,
					hidden = { file_browser = true, folder_browser = true },
					follow_symlinks = true,
					collapse_dirs = true,
					prompt_path = true,
					-- respect_gitignore
					-- browse_files
					-- browse_folders
					hide_parent_dir = false,
					quiet = false,
					dir_icon = "",
					dir_icon_hl = "Default",
					display_stat = { date = true, size = true, mode = true },
					use_fd = true,
					git_status = true,
					mappings = {
						["i"] = {
							["<A-c>"] = fb_actions.create,
							["<S-CR>"] = fb_actions.create_from_prompt,
							["<A-r>"] = fb_actions.rename,
							["<A-m>"] = fb_actions.move,
							["<A-y>"] = fb_actions.copy,
							["<A-d>"] = fb_actions.remove,
							["<C-o>"] = fb_actions.open,
							["<C-g>"] = fb_actions.goto_parent_dir,
							["<C-e>"] = fb_actions.goto_home_dir,
							["<C-w>"] = fb_actions.goto_cwd,
							["<C-t>"] = fb_actions.change_cwd,
							["<C-f>"] = fb_actions.toggle_browser,
							["<C-h>"] = fb_actions.toggle_hidden,
							["<C-s>"] = fb_actions.toggle_all,
							["<bs>"] = fb_actions.backspace,
						},
						["n"] = {
							["c"] = fb_actions.create,
							["r"] = fb_actions.rename,
							["m"] = fb_actions.move,
							["y"] = fb_actions.copy,
							["d"] = fb_actions.remove,
							["o"] = fb_actions.open,
							["g"] = fb_actions.goto_parent_dir,
							["e"] = fb_actions.goto_home_dir,
							["w"] = fb_actions.goto_cwd,
							["t"] = fb_actions.change_cwd,
							["f"] = fb_actions.toggle_browser,
							["h"] = fb_actions.toggle_hidden,
							["s"] = fb_actions.toggle_all,
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")
	end,
}

return M
