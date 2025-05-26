return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'typescript', 'javascript', 'html', 'css', 'python', 'lua', 'go', 'java' },
      sync_install = true,
      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['a@'] = '@parameter.outer',
            ['i@'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.def',
            [']]'] = '@class.def',
          },
          goto_next_end = {
            [']M'] = '@function.final',
            [']['] = '@class.final',
          },
          goto_prev_start = {
            ['[m'] = '@function.def',
            ['[['] = '@class.def',
          },
          goto_prev_end = {
            ['[M'] = '@function.final',
            ['[]'] = '@class.final',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [']a'] = '@parameter.inner',
          },
          swap_previous = {
            ['[a'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}
