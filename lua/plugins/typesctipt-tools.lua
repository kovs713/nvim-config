return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
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
