local M = {}

function M.setup()
  vim.cmd.packadd 'dressing.nvim'

  local dressing = require 'dressing'

  dressing.setup {}
end

return M
