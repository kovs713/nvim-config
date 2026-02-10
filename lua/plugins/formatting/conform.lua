return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
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
        python = { 'ruff' },
        go = { 'gofumpt' },
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
  end,
}
