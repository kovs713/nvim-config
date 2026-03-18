return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
  config = function()
    local function is_vue_project()
      local root = vim.fn.getcwd()

      if not root or root == '' then
        return false
      end

      local package_json = root .. '/package.json'
      if vim.fn.filereadable(package_json) == 1 then
        local content = vim.fn.readfile(package_json)
        local content_str = table.concat(content, '\n')
        if content_str:match '"vue"' or content_str:match '"nuxt"' or content_str:match '"@vue/"' then
          return true
        end
      end

      return false
    end

    if is_vue_project() then
      return
    end

    local map = vim.keymap.set
    map('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS [R]ename [F]ile + Fix Imports' })
    map('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize [I]mports' })

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
    }
  end,
}
