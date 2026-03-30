local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/stevearc/conform.nvim' }
  vim.cmd.packadd 'conform.nvim'

  local conform = require 'conform'

  conform.setup {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      javascript = { 'prettier', 'oxlint' },
      typescript = { 'prettier', 'oxlint' },
      javascriptreact = { 'prettier', 'oxlint' },
      typescriptreact = { 'prettier', 'oxlint' },
      vue = { 'prettier', 'oxlint' },
      svelte = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      graphql = { 'prettier' },
      lua = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports' },
      go = { 'gofumpt' },
      rust = { 'rustfmt' },
    },
  }

  conform.formatters.prettier = {
    args = {
      '--stdin-filepath',
      '$FILENAME',
    },
    cwd = require('conform.util').root_file { '.prettierrc', 'package.json', '.git' },
  }
  conform.formatters.shfmt = {
    prepend_args = { '-i', '4' },
  }

  vim.keymap.set('n', '<leader>f', function()
    conform.format { async = true, lsp_format = 'fallback' }
  end, { desc = '[F]ormat buffer' })
end

return M
