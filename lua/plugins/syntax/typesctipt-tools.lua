return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  },
  config = function()
    local map = vim.keymap.set
    map('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS [R]ename [F]ile + Fix Imports' })
    map('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize [I]mports' })

    require('typescript-tools').setup {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  end,
}
