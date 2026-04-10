local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/akinsho/toggleterm.nvim' },
  }, { confirm = false })

  local toggleterm = require 'toggleterm'
  local map = vim.keymap.set

  toggleterm.setup {
    direction = 'float',
  }

  map({ 'n', 't' }, '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' })
end

return M
