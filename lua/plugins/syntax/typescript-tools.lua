return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  config = function()
    local map = vim.keymap.set
    map('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS [R]ename [F]ile + Fix Imports' })
    map('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize [I]mports' })

    local function is_vue_project()
      local root = vim.fs.root(0, 'package.json')
      if not root then
        return false
      end
      local vue_files = vim.fn.glob(root .. '/**/*.vue', true, true)
      return #vue_files > 0
    end

    require('typescript-tools').setup {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },

      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,

      root_dir = function(fname)
        if is_vue_project() then
          return nil
        end
        return vim.fs.root(0, { 'package.json', 'tsconfig.json' })
      end,
    }
  end,
}
