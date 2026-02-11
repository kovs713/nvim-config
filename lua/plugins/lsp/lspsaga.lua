return {
  'nvimdev/lspsaga.nvim',
  config = function()
    local map = vim.keymap.set
    require('lspsaga').setup {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
      rename = {
        title = true,
        border = 'single',
      },
    }
    map('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', { desc = '[L]sp [H]over Doc' })
    map('n', '<leader>lR', '<cmd>Lspsaga rename<CR>', { desc = '[L]sp [R]ename' })
    map('n', '<leader>ld', function()
      require('fzf-lua').lsp_definitions()
    end, { desc = '[L]sp Peek [D]efinition' })
    map('n', 'gd', function()
      require('fzf-lua').lsp_definitions()
    end, { desc = '[L]sp Peek [D]efinition' })
    map('n', '<leader>[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = '[D]iagnostic next' })
    map('n', '<leader>]d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = '[D]iagnostic prev' })
    map('n', '<leader>lr', function()
      require('fzf-lua').lsp_references { silent = true }
    end, { desc = '[L]sp Peek [R]eferences' })
    map('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = '[L]sp Diagnostic Float [E]' })
  end,
}
