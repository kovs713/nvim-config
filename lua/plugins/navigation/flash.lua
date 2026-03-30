local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/folke/flash.nvim' }
  vim.cmd.packadd 'flash.nvim'

  local flash = require 'flash'
  local map = vim.keymap.set

  map({ 'n', 'x', 'o' }, 's', function()
    flash.jump()
  end, { desc = 'Fla[s]h' })

  map({ 'n', 'x', 'o' }, 'S', function()
    flash.treesitter()
  end, { desc = 'Fla[s]h Treesitter' })
end

return M
