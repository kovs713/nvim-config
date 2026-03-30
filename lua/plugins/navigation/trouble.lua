local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/nvim-mini/mini.icons' }
  vim.cmd.packadd 'mini.icons'
  vim.cmd.packadd 'trouble.nvim'

  local trouble = require 'trouble'
  local map = vim.keymap.set

  trouble.setup {}

  local function next()
    trouble.next { skip_groups = true, jump = true }
  end

  local function previous()
    trouble.previous { skip_groups = true, jump = true }
  end

  map('n', ']t', next, { desc = '[T]rouble next item' })
  map('n', '[t', previous, { desc = '[T]rouble previous item' })
  map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics toggle' })
end

return M
