return {
  'sindrets/winshift.nvim',
  config = function()
    local winshift = require 'winshift'

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
    vim.keymap.set('n', '<C-W>m', '<Cmd>WinShift<CR>')
    vim.keymap.set('n', '<C-A-h>', '<cmd>WinShift left<CR>', { desc = 'Move window left' })
    vim.keymap.set('n', '<C-A-j>', '<cmd>WinShift down<CR>', { desc = 'Move window down' })
    vim.keymap.set('n', '<C-A-k>', '<cmd>WinShift up<CR>', { desc = 'Move window up' })
    vim.keymap.set('n', '<C-A-l>', '<cmd>WinShift right<CR>', { desc = 'Move window right' })
  end,
}
