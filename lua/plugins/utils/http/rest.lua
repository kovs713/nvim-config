return {
  'rest-nvim/rest.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, 'http')
    end,
  },
  config = function()
    local rest = require 'rest-nvim'
    local map = vim.keymap.set

    rest.setup {}

    map('n', '<leader>hr', '<cmd>Rest run<cr>', { desc = '[H]ttp [R]un under cursor' })
    map('n', '<leader>hl', '<cmd>Rest last<cr>', { desc = '[H]ttp run [L]ast' })
    map('n', '<leader>hd', '<cmd>Rest run document<cr>', { desc = '[H]ttp run [D]ocument' })
  end,
}
