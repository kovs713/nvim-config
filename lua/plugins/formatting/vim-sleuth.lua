local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/tpope/vim-sleuth' }
  vim.cmd.packadd 'vim-sleuth'
end

return M
