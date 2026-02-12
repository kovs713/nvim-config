return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('refactoring').setup {}
    vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
      require('refactoring').select_refactor { prefer_ex_cmd = true }
    end, { desc = 'Refactor…' })

    vim.keymap.set({ 'n', 'x' }, '<leader>re', function()
      return require('refactoring').refactor 'Extract Function'
    end, { expr = true, desc = 'Extract Function' })
    vim.keymap.set({ 'n', 'x' }, '<leader>rv', function()
      return require('refactoring').refactor 'Extract Variable'
    end, { expr = true, desc = 'Extract Variable' })
    vim.keymap.set({ 'n', 'x' }, '<leader>rI', function()
      return require('refactoring').refactor 'Inline Function'
    end, { expr = true, desc = 'Inline Function' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ri', function()
      return require('refactoring').refactor 'Inline Variable'
    end, { expr = true, desc = 'Inline Variable' })
  end,
}
