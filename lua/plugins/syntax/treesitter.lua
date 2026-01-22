return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    local treesitter = require 'nvim-treesitter'
    treesitter.install {
      'bash',
      'go',
      'gomod',
      'gosum',
      -- 'groovy',
      -- 'java',
      -- 'javadoc',
      -- 'javascript',
      'lua',
      'luadoc',
      'python',
      'tsx',
      'typescript',
      'css',
      'html',
      'markdown',
      'markdown_inline',
      -- 'yaml',
      -- 'csv',
      -- 'json',
      -- 'json5',
      -- 'dockerfile',
      -- 'git_config',
      -- 'git_rebase',
      -- 'gitcommit',
      -- 'gitignore',
    }

    vim.treesitter.language.register('javascript', 'tsx')
    vim.treesitter.language.register('typescript.tsc', 'tsx')
  end,
}
