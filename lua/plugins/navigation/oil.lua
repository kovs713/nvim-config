return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts = {},
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '<leader>ef', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer [O]il' })
  end,
}
