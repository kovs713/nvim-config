local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/numToStr/Comment.nvim' },
  }, { confirm = false })

  local comment = require 'Comment'

  comment.setup {}
end

return M
