local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/vimpostor/vim-tpipeline' },
  }, { confirm = false })
end

return M
