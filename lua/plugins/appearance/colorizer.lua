return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    local colorizer = require 'nvim-highlight-colors'
    colorizer.setup {
      render = 'virtual',
      exclude_filetypes = { 'javascript', 'typescript' },
      enable_tailwind = true,
    }
  end,
}
