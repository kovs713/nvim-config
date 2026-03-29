local M = {}

local plugin = (function()
  return {
    {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      },
    },
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',
      },
      opts = {
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
      },
    },
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      dependencies = {
        'williamboman/mason.nvim',
      },
      opts = {
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
      },
    },
  }
end)()

function M.setup()
  vim.cmd.packadd 'mason.nvim'
  require('mason').setup(plugin[1].opts)

  vim.cmd.packadd 'nvim-lspconfig'
  vim.cmd.packadd 'mason-lspconfig.nvim'
  require('mason-lspconfig').setup(plugin[2].opts)

  vim.cmd.packadd 'mason-tool-installer.nvim'
  require('mason-tool-installer').setup(plugin[3].opts)
end

return M
