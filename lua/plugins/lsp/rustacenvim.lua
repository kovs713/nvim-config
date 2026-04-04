local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/mrcjkb/rustaceanvim' },
  }, { confirm = false })
end

return M
