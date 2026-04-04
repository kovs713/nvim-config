local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/refractalize/oil-git-status.nvim' },
  }, { confirm = false })

  local oil = require 'oil'
  local oil_git_status = require 'oil-git-status'
  local map = vim.keymap.set

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

  map('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer [O]il' })
end

return M
