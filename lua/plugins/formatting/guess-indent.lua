local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  }, { confirm = false })
end

return M
