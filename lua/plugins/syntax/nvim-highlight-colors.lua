local M = {}

function M.setup()
  vim.cmd.packadd 'nvim-highlight-colors'

  local colorizer = require 'nvim-highlight-colors'

  colorizer.setup {
    render = 'virtual',
    exclude_filetypes = { 'javascript', 'typescript' },
    enable_named_colors = false,
    enable_tailwind = true,
  }
end

return M
