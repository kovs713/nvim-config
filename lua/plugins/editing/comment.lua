local M = {}

function M.setup()
  vim.pack.add {'https://github.com/numToStr/Comment.nvim'}
  vim.cmd.packadd 'Comment.nvim'

  local comment = require 'Comment'

  comment.setup {}
end

return M
