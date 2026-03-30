local M = {}

function M.setup()
  vim.pack.add {'https://github.com/saecki/crates.nvim'}
  vim.cmd.packadd 'crates.nvim'

  local crates = require 'crates'

  crates.setup()
end

return M
