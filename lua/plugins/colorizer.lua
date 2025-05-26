return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    local colorizer = require 'nvim-highlight-colors'
    colorizer.setup {
      enable_tailwind = true,
    }
  end,
}
