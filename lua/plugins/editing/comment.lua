local M = {}

function M.setup()
  vim.cmd.packadd 'Comment.nvim'

  local comment = require 'Comment'

  comment.setup {}
end

return M
