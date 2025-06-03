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
      desc = '[F]ind by Grep x[D]',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').buffers()
      end,
      desc = '[F]ind Buffers :[O]',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = '[F]ind [R]ecent File',
    },
    {
      '<leader>fc',
      function()
        require('fzf-lua').git_commits()
      end,
      desc = '[F]ind Git [C]ommits',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').git_branches()
      end,
      desc = '[F]ind Git [B]ranches',
    },
    {
      '<leader>fs',
      function()
        require('fzf-lua').git_status()
      end,
      desc = '[F]ind Git [S]tatus',
    },
    {
      '<leader>ft',
      function()
        require('fzf-lua').git_stash()
      end,
      desc = '[F]ind Git S[t]ash',
    },
  },
}
