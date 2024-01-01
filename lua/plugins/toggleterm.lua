local M = {
  'akinsho/toggleterm.nvim',
  event = "VeryLazy",
  version = "*",
  config = function()
    require('toggleterm').setup{
      size = 15,
      persist_size = true,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      direction = 'float',
      float_opts = {
        width = 146,
        height = 42,
      }
    }
  end,
}
return M
