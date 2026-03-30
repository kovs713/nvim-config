local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
  vim.cmd.packadd 'plenary.nvim'
  vim.cmd.packadd 'nvim-treesitter'
  vim.cmd.packadd 'refactoring.nvim'

  local refactoring = require 'refactoring'
  local map = vim.keymap.set

  refactoring.setup {}

  map({ 'n', 'x' }, '<leader>rr', function()
    refactoring.select_refactor { prefer_ex_cmd = true }
  end, { desc = '[R]efactor context menu' })

  map({ 'n', 'x' }, '<leader>rf', function()
    refactoring.refactor 'Extract Function'
  end, { expr = true, desc = '[R]efactor Extract [F]unction' })

  map({ 'n', 'x' }, '<leader>rv', function()
    refactoring.refactor 'Extract Variable'
  end, { expr = true, desc = '[R]efactor Extract [V]ariable' })

  map({ 'n', 'x' }, '<leader>rI', function()
    refactoring.refactor 'Inline Function'
  end, { expr = true, desc = '[R]efactor [I]nline Function' })

  map({ 'n', 'x' }, '<leader>ri', function()
    refactoring.refactor 'Inline Variable'
  end, { expr = true, desc = '[R]efactor [I]nline Variable' })
end

return M
