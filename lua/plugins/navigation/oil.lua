return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts = {},
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '<leader>er', function()
      vim.cmd 'vsplit'
      vim.cmd 'Oil'
      vim.cmd 'vertical resize 30'
    end, { desc = 'Open [E]xplorer [O]il' })
  end,
}
