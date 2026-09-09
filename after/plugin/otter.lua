local otter = require 'otter'

otter.setup {
  lsp = {
    hover = { border = 'rounded' },
  },
  buffers = {
    set_filetype = true,
  },
}
