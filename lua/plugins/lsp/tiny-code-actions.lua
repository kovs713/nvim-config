local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
  vim.cmd.packadd 'plenary.nvim'
  vim.cmd.packadd 'snacks.nvim'
  vim.cmd.packadd 'tiny-code-action.nvim'

  local tiny_code_action = require 'tiny-code-action'

  tiny_code_action.setup {
    format_title = function(action, client)
      if action.kind then
        return string.format('%s (%s)', action.title, action.kind)
      end
      return action.title
    end,
  }
end

return M
