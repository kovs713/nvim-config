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
    vim.keymap.set('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>')
    vim.keymap.set('n', '<leader>lr', '<cmd>Lspsaga rename<CR>')
    vim.keymap.set('n', '<leader>lp', '<cmd>Lspsaga peek_definition<CR>')
    vim.keymap.set('n', '<leader>[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    vim.keymap.set('n', '<leader>]d', '<cmd>Lspsaga diagnostic_jump_next<CR>')
    vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga goto_definition<CR>')
    vim.keymap.set('n', '<leader>lb', '<cmd>lua vim.lsp.buf.references<CR>')
    vim.keymap.set('n', '<leader>lg', '<cmd>lua vim.diagnostic.open_float<CR>')
  end,
}
