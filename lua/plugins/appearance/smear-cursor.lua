local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/sphamba/smear-cursor.nvim' },
  }, { confirm = false })

  local smear_cursor = require 'smear_cursor'

  smear_cursor.enabled = true
end

return M
