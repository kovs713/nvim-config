local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/saecki/crates.nvim' },
  }, { confirm = false })

  local crates = require 'crates'

  crates.setup()
end

return M
