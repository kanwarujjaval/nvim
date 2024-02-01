local M = {
  "nvimtools/none-ls.nvim",
  lazy = false,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d.with({
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "json", "markdown" }, -- Exclude filetypes handled by eslint_d
        }),
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.black,
      },
    })
  end,
}

return M
