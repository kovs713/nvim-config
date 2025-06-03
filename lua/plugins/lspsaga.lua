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
    vim.keymap.set('n', '<leader>dh', '<cmd>Lspsaga hover_doc<CR>', { desc = "[D]oc [H]over" })
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', { desc = "[R]e[n]ame" })
    vim.keymap.set('n', '<leader>pd', '<cmd>Lspsaga peek_definition<CR>', { desc = "[P]eek [D]efinition" })
    vim.keymap.set('n', '<leader>[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "[D]iagnostic next" })
    vim.keymap.set('n', '<leader>]d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "[D]iagnostic prev" })
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = "[G]oto [D]efinition" })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references<CR>', { desc = "[G]oto [R]eferences" })
    vim.keymap.set('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float<CR>', { desc = "Open [D]iagnostic [F]loat" })
  end,
}
