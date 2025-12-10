require('lazy').setup {
  spec = {
    { import = 'plugins.appearance' },
    { import = 'plugins.cmp' },
    { import = 'plugins.editing' },
    { import = 'plugins.formatting' },
    { import = 'plugins.git' },
    { import = 'plugins.lsp' },
    { import = 'plugins.mini' },
    { import = 'plugins.navigation' },
    { import = 'plugins.productivity' },
    { import = 'plugins.syntax' },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}
