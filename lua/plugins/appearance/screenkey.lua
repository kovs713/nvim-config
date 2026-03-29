local M = {}

function M.setup()
  vim.cmd.packadd 'screenkey.nvim'

  local map = vim.keymap.set

  map('n', '<leader>ts', '<CMD>Screenkey toggle<CR>', { desc = '[T]oggle [S]creen[K]ey' })
end

return M
