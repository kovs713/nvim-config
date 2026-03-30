local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/nvim-mini/mini.icons' }
  vim.cmd.packadd 'mini.icons'
  vim.cmd.packadd 'oil.nvim'

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

  map('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer [O]il' })
end

return M
