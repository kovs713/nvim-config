return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client)
      vim.keymap.set('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS: Rename File + Fix Imports' })
      client.server_capabilities.documentFormattingProvider = false
    end,
    include_inlay_parameter_name_hints = 'all',
    include_inlay_parameter_name_hints_when_argument_matches_name = true,
    include_inlay_function_parameter_type_hints = true,
    include_inlay_variable_type_hints = true,
    include_inlay_variable_type_hints_when_type_matches_name = true,
    include_inlay_property_declaration_type_hints = true,
    include_inlay_function_like_return_type_hints = true,
    include_inlay_enum_member_value_hints = true,
  },
}
