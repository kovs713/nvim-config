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

-- transparent background
-- vim.api.nvim_set_hl(-1, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "Pmenu", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "Terminal", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "EndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "FoldColumn", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "Folded", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "WhichKeyFloat", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "TelescopeBorder", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "TelescopeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "TelescopePromptBorder", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "TelescopePromptTitle", { bg = "none" })

-- transparent background for neotree
-- vim.api.nvim_set_hl(-1, "NeoTreeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NeoTreeNormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NeoTreeVertSplit", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NeoTreeWinSeparator", { bg = "none" })
-- vim.api.nvim_set_hl(-1, "NeoTreeEndOfBuffer", { bg = "none" })
