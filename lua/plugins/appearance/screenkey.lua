local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/NStefan002/screenkey.nvim' }
  vim.cmd.packadd 'screenkey.nvim'

  local map = vim.keymap.set

  map('n', '<leader>ts', '<CMD>Screenkey toggle<CR>', { desc = '[T]oggle [S]creen[K]ey' })
end

return M
