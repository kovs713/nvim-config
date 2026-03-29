local M = {}

function M.setup()
  vim.cmd.packadd 'nvim-ts-context-commentstring'

  local ts_context_commentstring = require 'ts_context_commentstring'

  ts_context_commentstring.setup {
    enable_autocmd = false,
  }
end

return M
