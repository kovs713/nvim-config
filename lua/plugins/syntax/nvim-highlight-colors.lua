local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/brenoprata10/nvim-highlight-colors' },
  }, { confirm = false })

  local nvim_highlight_colors = require 'nvim-highlight-colors'

  nvim_highlight_colors.setup {
    render = 'virtual',
    exclude_filetypes = { 'javascript', 'typescript' },
    enable_named_colors = false,
    enable_tailwind = true,
  }
end

return M
