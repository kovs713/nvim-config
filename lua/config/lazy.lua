local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },

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

    { import = 'plugins.disabled' },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
