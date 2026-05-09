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

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  automatic_enable = false,
  ensure_installed = {
    'gopls',
    'marksman',
    'jsonls',
    'yamlls',
    'bashls',
    'intelephense',
    'html',
    'cssls',
    'tailwindcss',
    'vue_ls',
    'vtsls',
    'lua_ls',
    'graphql',
    'emmet_ls',
    'pyright',
    'astro',
    'svelte',
    'solidity',
    'ruff',
  },
}

local mason_tool_installer = require 'mason-tool-installer'

mason_tool_installer.setup {
  ensure_installed = {
    'prettier',
    'eslint_d',
    'solhint',
    'biome',
    'phpcs',
    'phpstan',
    'stylua',
    'ruff',
    'gofumpt',
    'golangci-lint',
    'kulala-fmt',
    'shfmt',
  },
}
