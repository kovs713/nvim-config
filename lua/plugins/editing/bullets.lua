local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/bullets-vim/bullets.vim' }
  vim.cmd.packadd 'bullets.vim'

  vim.g.bullets_delete_last_bullet_if_empty = 2
end

return M
