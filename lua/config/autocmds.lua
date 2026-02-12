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
    local map = vim.keymap.set
    local fzf = require 'fzf-lua'

    opts.desc = '[C]ode [A]ctions'
    map({ 'n', 'v' }, '<leader>ca', function()
      fzf.lsp_code_actions { silent = true }
    end, opts)

    opts.desc = '[L][L]sp Restart'
    map({ 'n', 'v' }, '<leader>lL', '<cmd>LspRestart<CR>', opts)

    opts.desc = '[L]sp [I]mplimentations'
    map('n', '<leader>li', function()
      fzf.lsp_implementations { silent = true }
    end, opts)

    opts.desc = '[L]sp Peek [D]efinition'
    map('n', '<leader>ld', function()
      fzf.lsp_definitions()
    end, opts)

    opts.desc = '[L]sp Peek [D]efinition'
    map('n', 'gd', function()
      fzf.lsp_definitions()
    end, opts)

    opts.desc = '[L]sp Peek [R]eferences'
    map('n', '<leader>lR', function()
      fzf.lsp_references { silent = true }
    end, opts)

    opts.desc = '[L]sp Diagnostic Float [E]'
    map('n', '<leader>le', function()
      vim.diagnostic.open_float()
    end, opts)

    opts.desc = '[L]sp [H]over Doc'
    map('n', '<leader>lh', function()
      vim.lsp.buf.hover()
    end, opts)

    opts.desc = '[L]sp [R]ename'
    map('n', '<leader>lr', function()
      vim.lsp.buf.rename()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
  end,
})
