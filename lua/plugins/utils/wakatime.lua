local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/wakatime/vim-wakatime' },
  }, { confirm = false })
end

return M
