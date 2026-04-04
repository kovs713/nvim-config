local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring' },
  }, { confirm = false })

  local ts_context_commentstring = require 'ts_context_commentstring'

  ts_context_commentstring.setup {
    enable_autocmd = false,
  }
end

return M
