local M = {}

function M.setup()
  vim.pack.add {'https://github.com/vimpostor/vim-tpipeline'}
  vim.cmd.packadd 'vim-tpipeline'
end

return M
