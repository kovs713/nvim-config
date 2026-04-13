local M = {}

function M.setup()
  -- vim.pack.add({
  --   { src = 'https://github.com/rest-nvim/rest.nvim' },
  --   { src = 'https://github.com/nvim-neotest/nvim-nio' },
  --   { src = 'https://github.com/j-hui/fidget.nvim' },
  -- }, { confirm = false })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'http',
      'rest',
    },
    callback = function()
      -- local rest = require 'rest-nvim'
      local map = vim.keymap.set

      -- rest.setup()

      map('n', '<leader>hr', '<cmd>Rest run<cr>', { desc = '[H]ttp [R]un under cursor', buffer = true })
      map('n', '<leader>hl', '<cmd>Rest last<cr>', { desc = '[H]ttp run [L]ast', buffer = true })
      map('n', '<leader>hd', '<cmd>Rest run document<cr>', { desc = '[H]ttp run [D]ocument', buffer = true })
    end,
  })
end

return M
