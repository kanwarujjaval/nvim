local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion

        -- Set eslint_d as default linter
        
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --     only_local = "node_modules/.bin"
        -- })
        
        -- Set eslint_d as default code actions
        
        -- null_ls.builtins.code_actions.eslint_d.with({
        --     only_local = "node_modules/.bin"
        -- })
        
        return {
            debug = true,
            sources = {
                formatting.shfmt,
                formatting.stylua,
                formatting.prettier,
                formatting.clang_format,
                formatting.taplo,
                formatting.black,
                formatting.fish_indent,
                diagnostics.fish,
                diagnostics.trail_space,
                diagnostics.cspell.with({
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = vim.diagnostic.severity["WARN"]
                    end,
                }),
                code_actions.gitsigns,
                code_actions.cspell,
            },
        }
    end,
}

return M