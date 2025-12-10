require('lazy').setup {
  -- add LazyVim and import its plugins
  -- { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },

  -- import/override with your plugins
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
  { import = 'plugins.theme' },

  -- { import = 'plugins.disabled' },
}
