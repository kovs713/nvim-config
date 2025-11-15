return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require 'nvim-treesitter.configs'
    treesitter.setup {
      ensure_installed = { 'lua', 'markdown', 'markdown_inline', 'javascript', 'typescript' },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      folds = { enable = true },
    }
  end,
}
