return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  config = function()
    local refactoring = require 'refactoring'
    local map = vim.keymap.set
    refactoring.setup {}

    map({ 'n', 'x' }, '<leader>rr', function()
      require('refactoring').select_refactor { prefer_ex_cmd = true }
    end, { desc = '[R]efactor context menu' })

    map({ 'n', 'x' }, '<leader>rf', function()
      return require('refactoring').refactor 'Extract Function'
    end, { expr = true, desc = '[R]efactor Extract [F]unction' })

    map({ 'n', 'x' }, '<leader>rv', function()
      return require('refactoring').refactor 'Extract Variable'
    end, { expr = true, desc = '[R]efactor Extract [V]ariable' })

    map({ 'n', 'x' }, '<leader>rI', function()
      return require('refactoring').refactor 'Inline Function'
    end, { expr = true, desc = '[R]efactor [I]nline Function' })

    map({ 'n', 'x' }, '<leader>ri', function()
      return require('refactoring').refactor 'Inline Variable'
    end, { expr = true, desc = '[R]efactor [I]nline Variable' })
  end,
}
