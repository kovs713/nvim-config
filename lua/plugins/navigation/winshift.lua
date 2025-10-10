return {
  'sindrets/winshift.nvim',
  config = function()
    local winshift = require 'winshift'

    vim.keymap.set('n', '<C-W>m', '<CMD>WinShift<CR>', { desc = 'Toggle WinShift mode' })

    vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Moving to the window left [h]' })
    vim.keymap.set('n', '<A-j>', '<C-w>j', { desc = 'Moving to the window down [j]' })
    vim.keymap.set('n', '<A-k>', '<C-w>k', { desc = 'Moving to the window up [k]' })
    vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Moving to the window right [l]' })

    vim.keymap.set('n', '<A-=>', '<C-w>+', { desc = 'Resize window + (increace horizontal)' })
    vim.keymap.set('n', '<A-->', '<C-w>-', { desc = 'Resize window - (decreace horizontal)' })
    vim.keymap.set('n', '<A-.>', '<C-w><', { desc = 'Resize window < (increace vertical)' })
    vim.keymap.set('n', '<M-,>', '<C-w>>', { desc = 'Resize window > (decreace vertical)' })

    winshift.setup {
      highlight_moving_win = true,
      focused_hl_group = 'Visual',
      moving_win_options = {
        wrap = true,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = '',
      },
      keymaps = {
        disable_defaults = false,
      },
    }
  end,
}
