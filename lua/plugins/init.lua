require('lazy').setup {
  spec = {
    { import = 'plugins.appearance' },
    { import = 'plugins.editing' },
    { import = 'plugins.formatting' },
    { import = 'plugins.lsp' },
    { import = 'plugins.navigation' },
    { import = 'plugins.syntax' },
    { import = 'plugins.utils' },
    { import = 'plugins.utils.http' },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}
