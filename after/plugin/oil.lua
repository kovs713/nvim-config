local oil = require 'oil'

oil.setup {
  win_options = {
    signcolumn = 'yes:2',
  },
  default_file_explorer = true,
  watch_for_changes = true,
  buf_options = {
    buflisted = false,
    bufhidden = 'hide',
  },
  view_options = {
    show_hidden = true,
  },
}

local oil_git_status = require 'oil-git-status'
oil_git_status.setup {
  show_ignored = true,
  symbols = {
    index = {
      ['!'] = '!',
      ['?'] = '?',
      ['A'] = 'A',
      ['C'] = 'C',
      ['D'] = 'D',
      ['M'] = 'M',
      ['R'] = 'R',
      ['T'] = 'T',
      ['U'] = 'U',
      [' '] = ' ',
    },
    working_tree = {
      ['!'] = '!',
      ['?'] = '?',
      ['A'] = 'A',
      ['C'] = 'C',
      ['D'] = 'D',
      ['M'] = 'M',
      ['R'] = 'R',
      ['T'] = 'T',
      ['U'] = 'U',
      [' '] = ' ',
    },
  },
}

vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open Oil explorer' })
