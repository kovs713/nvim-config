return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
  config = function()
    require('oil').setup {
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
    vim.keymap.set('n', '<leader>ef', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer [O]il' })
  end,
}
