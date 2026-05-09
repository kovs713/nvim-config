local toggleterm = require 'toggleterm'

toggleterm.setup {
  direction = 'float',
}

vim.keymap.set({ 'n', 't' }, '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
