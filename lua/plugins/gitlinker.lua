local M = {
  'linrongbin16/gitlinker.nvim',
  lazy = true,
  event = 'BufRead',
  config = function()
    require('gitlinker').setup()
  end,
}

return M
