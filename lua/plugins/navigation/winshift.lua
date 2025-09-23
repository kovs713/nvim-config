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
    vim.keymap.set('n', '<C-W>m', '<Cmd>WinShift<CR>', { desc = 'Toggle WinShift mode' })
    vim.keymap.set('n', '<C-A-h>', '<cmd>WinShift left<CR>', { desc = 'Move window left [h]' })
    vim.keymap.set('n', '<C-A-j>', '<cmd>WinShift down<CR>', { desc = 'Move window down [j]' })
    vim.keymap.set('n', '<C-A-k>', '<cmd>WinShift up<CR>', { desc = 'Move window up [k]' })
    vim.keymap.set('n', '<C-A-l>', '<cmd>WinShift right<CR>', { desc = 'Move window right [l]' })

    vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Moving to the window left [h]' })
    vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Moving to the window down [j]' })
    vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Moving to the window up [k]' })
    vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Moving to the window right [l]' })

    vim.keymap.set('n', '<M-=>', '<C-w>+', { desc = 'Resize window + (increace horizontal)' })
    vim.keymap.set('n', '<M-->', '<C-w>-', { desc = 'Resize window - (decreace horizontal)' })
    vim.keymap.set('n', '<M-.>', '<C-w><', { desc = 'Resize window < (increace vertical)' })
    vim.keymap.set('n', '<M-,>', '<C-w>>', { desc = 'Resize window > (decreace vertical)' })
  end,
}
