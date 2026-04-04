local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/folke/which-key.nvim' },
  }, { confirm = false })

  local whick_key = require 'which-key'
  local map = vim.keymap.set

  whick_key.setup {}

  map('n', '<leader>?', function()
    whick_key.show { global = false }
  end, { desc = 'Buffer Local Keymaps (which-key)' })
end

return M
