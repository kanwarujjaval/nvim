local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
            { text = { "%s" },                  click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
      end,
    },
  },
  lazy = true,
  event = "BufReadPost",
  opts = {
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
  },
  config = function(_, opts)
    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)

    --	local capabilities = vim.lsp.protocol.make_client_capabilities()
    --	capabilities.textDocument.foldingRange = {
    --		dynamicRegistration = false,
    --		lineFoldingOnly = true,
    --	}
    -- 	local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    -- 	for _, ls in ipairs(language_servers) do
    -- 		require("lspconfig")[ls].setup({
    -- 			capabilities = capabilities,
    -- 		})
    -- 	end
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
      end,
    })
  end,
}

return M
