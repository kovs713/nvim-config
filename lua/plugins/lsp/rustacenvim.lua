local M = {}

function M.setup()
  vim.pack.add {'https://github.com/mrcjkb/rustaceanvim'}
  vim.cmd.packadd 'rustaceanvim'
end

return M
