return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
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
        'ruff', -- python
      },
    },
    dependencies = {
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
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'prettier', -- prettier formatter
        'eslint_d', -- js linter
        'stylua', -- lua formatter
        'isort', -- python formatter
        'ruff', -- python formatter
        'gofumpt', -- golang formatter
        'golangci-lint', -- golang lint
        'kulala-fmt', -- http
      },
    },
    dependencies = {
      'williamboman/mason.nvim',
    },
  },
}
