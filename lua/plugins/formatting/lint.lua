return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      java = { 'checkstyle' },
      go = { 'golangcilint' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      lua = { 'luacheck' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.opt_local.modifiable:get() then
          lint.try_lint()
        end
      end,
    })

    vim.keymap.set('n', '<leader>lt', function()
      vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end, { desc = '[L]int [T]oggle' })
  end,
}
