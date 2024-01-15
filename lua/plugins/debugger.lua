local M = {
	"mfussenegger/nvim-dap",
	lazy = false,
	-- event = "BufReadPre",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				{ "folke/neodev.nvim", opts = {} },
			},
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			config = true,
			dependencies = {
				{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
			},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				{ "williamboman/mason.nvim", opts = {} },
			},
		},
	},
	config = function()
		require("dapui").setup()

		require("mason-nvim-dap").setup({
			ensure_installed = {
				"js",
			},
		})

		local dap, dapui = require("dap"), require("dapui")

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Current File (pwa-node)",
					cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
					args = { "${file}" },
					sourceMaps = true,
					protocol = "inspector",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Current File (Typescript)",
					cwd = "${workspaceFolder}",
					runtimeArgs = { "--loader=ts-node/esm" },
					program = "${file}",
					runtimeExecutable = "node",
					-- args = { '${file}' },
					sourceMaps = true,
					protocol = "inspector",
					outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
					skipFiles = { "<node_internals>/**", "node_modules/**" },
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
				},
			}
		end

		-- Add vscode configurations
		require("dap.ext.vscode").load_launchjs(".vscode/launch.json", {
			node = { "typescript", "javascript" },
			["pwa-node"] = { "typescript", "javascript" },
		})

		-- NodeJS adapter
		local node_dap_adapter = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					require("mason-registry").get_package("js-debug-adapter"):get_install_path()
						.. "/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
			options = {
				max_retries = 40,
			},
			enrich_config = function(conf, on_config)
				if not vim.startswith(conf.type, "pwa-") then
					local config = vim.deepcopy(conf)
					config.type = "pwa-" .. config.type
					on_config(config)
				else
					on_config(conf)
				end
			end,
		}
		dap.adapters["node"] = node_dap_adapter
		dap.adapters["pwa-node"] = node_dap_adapter

		-- UI
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Neodev for type checking and completion
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		-- Keymaps
		vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>") -- Toggle breakpoint
		vim.keymap.set("n", "<leader>dB", function()
			-- Get user input
			local input = vim.fn.input("Condition: ")
			if not input or input == "" then
				return
			end

			dap.set_breakpoint(input)
		end)
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>") -- Continue execution
		vim.keymap.set("n", "<Leader>dq", ":DapTerminate<CR>") -- Terminate session
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>") -- Step over function
		vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>") -- Step into function
		vim.keymap.set("n", "<Leader>dr", ":DapStepOut<CR>") -- Step out of function
		vim.keymap.set("n", "<Leader>dl", ":DapListBreakpoints<CR>") -- List breakpoints
		vim.keymap.set("n", "<Leader>dv", ":DapUIVariables<CR>") -- Show variables view
		vim.keymap.set("n", "<Leader>dt", ":DapUIStacktrace<CR>") -- Show stacktrace
    vim.keymap.set("n", "<Leader>dT", ":DapVirtualTextToggle<CR>") -- Show errors
		vim.keymap.set("n", "<Leader>dw", ":DapUIWatch<CR>") -- Show watches view
		vim.keymap.set("n", "<Leader>d?", ":DapToggleRepl<CR>") -- Toggle DapToggleRepl
		vim.keymap.set("n", "<leader>dV", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set("n", "<Leader>dll", function()
			if vim.fn.filereadable(".vscode/launch.json") then
				require("dap.ext.vscode").load_launchjs(nil, {
					node = { "typescript", "javascript" },
					["pwa-node"] = { "typescript", "javascript" },
				})
			end
		end)

		-- Highlight groups
		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#fb4934", bg = "#3c3836" }) -- bright red
		vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#fabd2f", bg = "#3c3836" }) -- bright yellow
		vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#8ec07c", bg = "#3c3836" }) -- bright aqua/green
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#b8bb26", bg = "#3c3836" }) -- bright green

		-- Signs
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "⬤", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "",
			texthl = "DapBreakpointRejected",
			linehl = "DapBreakpointRejected",
			numhl = "DapBreakpointRejected",
		})
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)
	end,
}

return M
