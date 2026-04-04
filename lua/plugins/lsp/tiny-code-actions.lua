local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/rachartier/tiny-code-action.nvim' },
  }, { confirm = false })

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
