vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = '[C]ode [A]ctions'
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
      require('fzf-lua').lsp_code_actions { silent = true }
    end, opts)

    opts.desc = '[L][L]sp Restart'
    vim.keymap.set({ 'n', 'v' }, '<leader>lL', '<cmd>LspRestart<CR>', opts)

    opts.desc = '[L]sp [I]mplimentations'
    vim.keymap.set('n', '<leader>li', function()
      require('fzf-lua').lsp_implementations { silent = true }
    end, opts)

    vim.keymap.set('i', '<C-h>', function()
      vim.lsp.buf.signature_help()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
  end,
})
