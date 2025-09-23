return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('todo-comments').setup()
    vim.keymap.set('n', '<leader>ft', '<cmd>TodoFzfLua<CR>', { desc = '[F]zfLua [T]odo Comments' })
  end,
}
