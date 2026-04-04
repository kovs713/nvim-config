local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/tpope/vim-sleuth' },
  }, { confirm = false })
end

return M
