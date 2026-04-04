local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/stevearc/dressing.nvim' },
  }, { confirm = false })

  local dressing = require 'dressing'

  dressing.setup {}
end

return M
