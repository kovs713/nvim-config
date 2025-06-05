return {
  'nvimdev/lspsaga.nvim',
  config = function()
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
    vim.keymap.set('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', { desc = '[L]sp [H]over Doc' })
    vim.keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>', { desc = '[L]sp [R]ename' })
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga peek_definition<CR>', { desc = '[L]sp Peek [D]efinition' })
    vim.keymap.set('n', '<leader>[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = '[D]iagnostic next' })
    vim.keymap.set('n', '<leader>]d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = '[D]iagnostic prev' })
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references<CR>', { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = '[L]sp Diagnostic Float [E]' })
  end,
}
