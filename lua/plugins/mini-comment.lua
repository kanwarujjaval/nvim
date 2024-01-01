local M = {
  "echasnovski/mini.comment",
  version = "*",
  event = "BufRead",
  config = function()
    require("mini.comment").setup()
  end,
}

return M
