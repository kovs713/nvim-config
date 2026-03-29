local M = {}

function M.setup()
  vim.cmd.packadd 'crates.nvim'

  local crates = require 'crates'

  crates.setup()
end

return M
