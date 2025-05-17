return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require 'fzf-lua'

    fzf.setup {
      fzf_opts = {
        ['--layout'] = 'reverse',
        ['--info'] = 'inline',
        ['--border'] = 'rounded',
        ['--prompt'] = '🔍 ',
      },
      files = {
        file_ignore_patterns = {
          '^%.git/',
          '^%.mypy_cache/',
          '^__pycache__/',
          '^output/',
          '^data/',
          '%.ipynb',
        },
      },
      grep = {
        file_ignore_patterns = {
          '^%.git/',
          '^%.mypy_cache/',
          '^__pycache__/',
          '^output/',
          '^data/',
          '%.ipynb',
        },
      },
    }
  end,
  keys = {
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').live_grep()
      end,
      desc = '[F]ind by [G]rep',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[B]uffers',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[O]pen [R]ecent File',
    },
    {
      '<leader>fg',
      function()
        require('fzf-lua').git_commits()
      end,
      desc = '[G]it [C]ommits',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').git_branches()
      end,
      desc = '[G]it [B]ranches',
    },
    {
      '<leader>gss',
      function()
        require('fzf-lua').git_status()
      end,
      desc = '[G]it [S]tatus',
    },
    {
      '<leader>gs',
      function()
        require('fzf-lua').git_stash()
      end,
      desc = '[G]it [S]tash',
    },
  },
}
