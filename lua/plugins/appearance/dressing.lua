local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/stevearc/dressing.nvim' }
  vim.cmd.packadd 'dressing.nvim'

  local dressing = require 'dressing'

  dressing.setup {}
end

return M
