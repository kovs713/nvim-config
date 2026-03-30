local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/wakatime/vim-wakatime' }
  vim.cmd.packadd 'vim-wakatime'
end

return M
