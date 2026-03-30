local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/NMAC427/guess-indent.nvim' }
  vim.cmd.packadd 'guess-indent.nvim'
end

return M
