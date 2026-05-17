local todo_comments = require 'todo-comments'

todo_comments.setup {
  highlight = {
    comments_only = false,
  },
}

vim.keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>', { desc = 'Todo comments' })
