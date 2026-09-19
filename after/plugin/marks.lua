local marks = require 'marks'

marks.setup {
  default_mappings = true,

  builtin_marks = { '.', '<', '>', '^' },

  cyclic = true,

  force_write_shada = false,

  refresh_interval = 250,

  excluded_filetypes = {},

  excluded_buftypes = {},

  mappings = {},
}
