return {
  'olrtg/nvim-emmet',
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>we', require('nvim-emmet').wrap_with_abbreviation, { desc = '[W]rap [E]lement' })
  end,
}
