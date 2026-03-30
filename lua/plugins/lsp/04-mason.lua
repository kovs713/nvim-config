local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/williamboman/mason.nvim' }
  vim.cmd.packadd 'mason.nvim'

  local mason = require 'mason'

  mason.setup {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  }

  vim.cmd.packadd 'nvim-lspconfig'
  vim.cmd.packadd 'mason-lspconfig.nvim'

  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    automatic_enable = false,
    ensure_installed = {
      'gopls', -- golang
      'marksman', -- markdown
      'jsonls', -- json
      'yamlls', -- yaml
      'html', -- html
      'cssls', -- css
      'tailwindcss', -- tailwind
      'vue_ls', -- vue
      'vtsls', -- vue ts
      'lua_ls', -- lua
      'graphql', -- grqphql
      'emmet_ls', -- emmet
      'pyright', -- python
      'ruff', -- python
    },
  }

  vim.cmd.packadd 'mason-tool-installer.nvim'

  local mason_tool_installer = require 'mason-tool-installer'

  mason_tool_installer.setup {
    ensure_installed = {
      'prettier', -- prettier formatter
      'eslint_d', -- js linter
      'biome', -- js
      'stylua', -- lua formatter
      'ruff', -- python formatter
      'gofumpt', -- golang formatter
      'golangci-lint', -- golang lint
      'kulala-fmt', -- http
    },
  }
end

return M
