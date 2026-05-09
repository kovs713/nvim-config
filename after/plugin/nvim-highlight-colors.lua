local nvim_highlight_colors = require 'nvim-highlight-colors'

nvim_highlight_colors.setup {
  render = 'virtual',
  exclude_filetypes = {
    'javascript',
    'typescript',
  },
  enable_named_colors = false,
  enable_tailwind = true,
}
