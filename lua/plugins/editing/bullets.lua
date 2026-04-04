local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/bullets-vim/bullets.vim' },
  }, { confirm = false })

  vim.g.bullets_delete_last_bullet_if_empty = 2
end

return M
