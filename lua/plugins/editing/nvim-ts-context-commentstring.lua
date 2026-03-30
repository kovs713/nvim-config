local M = {}

function M.setup()
  vim.pack.add {'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'}
  vim.cmd.packadd 'nvim-ts-context-commentstring'

  local ts_context_commentstring = require 'ts_context_commentstring'

  ts_context_commentstring.setup {
    enable_autocmd = false,
  }
end

return M
