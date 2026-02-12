return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    local oil = require 'oil'
    local map = vim.keymap.set

    oil.setup {
      default_file_explorer = true,
      watch_for_changes = true,
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      view_options = {
        show_hidden = true,
      },
    }

    map('n', '<leader>ef', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer [O]il' })
  end,
}
