return {
  'oysandvik94/curl.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local curl = require 'curl'
    local map = vim.keymap.set

    curl.setup {
      open_with = 'split',
      curl_binary = 'curl',
    }

    map('n', '<leader>co', function()
      curl.open_curl_tab()
    end, { desc = 'Open a curl tab scoped to the current working directory' })

    map('n', '<leader>cx', function()
      curl.close_curl_tab()
    end, { desc = 'Close curl tab' })

    map('n', '<leader>cg', function()
      curl.open_global_tab()
    end, { desc = 'Open a curl tab with gloabl scope' })
  end,
}
