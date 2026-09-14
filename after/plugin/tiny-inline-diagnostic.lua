local tiny_inline_diagnostic = require 'tiny-inline-diagnostic'

tiny_inline_diagnostic.setup {
  preset = 'simple',
  transparent_cursorline = false,
  options = {
    multilines = {
      enabled = true,
    },
  },
}
