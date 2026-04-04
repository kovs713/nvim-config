local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/mistweaverco/kulala.nvim' },
  }, { confirm = false })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'http',
      'rest',
    },
    callback = function()
      local kulala = require 'kulala'
      local map = vim.keymap.set

      kulala.setup {}

      map('n', '<leader>hq', function()
        kulala.run()
      end, { desc = '[H]ttp send re[Q]uest' })
      map('n', '<leader>ha', function()
        kulala.run_all()
      end, { desc = '[H]ttp send [A]ll request' })
      map('n', '<leader>ho', function()
        kulala.scratchpad()
      end, { desc = '[H]ttp [O]pen scratchpad' })
      map('n', '<leader>ht', function()
        kulala.toggle_view()
      end, { desc = '[H]ttp [T]oggle view' })
    end,
  })
end

return M
