-- Yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Lsp commands
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Keymaps
    opts.desc = '[C]ode [A]ctions'
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
      vim.lsp.buf.code_action()
    end, opts)

    opts.desc = '[L][L]sp Restart'
    vim.keymap.set({ 'n', 'v' }, '<leader>lL', '<cmd>lsp restart<CR>', opts)

    opts.desc = '[L]sp [I]mplementations'
    vim.keymap.set('n', '<leader>li', function()
      Snacks.picker.lsp_implementations()
    end, opts)

    opts.desc = '[L]sp [D]efinitions'
    vim.keymap.set('n', '<leader>ld', function()
      Snacks.picker.lsp_definitions()
    end, opts)

    vim.keymap.set('n', 'gd', function()
      Snacks.picker.lsp_definitions()
    end, { buffer = event.buf, desc = 'Go to [D]efinition' })

    opts.desc = '[L]sp [R]eferences'
    vim.keymap.set('n', '<leader>lr', function()
      Snacks.picker.lsp_references()
    end, opts)

    opts.desc = '[L]sp Diagnostic Float [E]'
    vim.keymap.set('n', '<leader>le', function()
      vim.diagnostic.open_float()
    end, opts)

    opts.desc = '[L]sp [H]over Doc'
    vim.keymap.set('n', '<leader>lh', function()
      vim.lsp.buf.hover()
    end, opts)

    opts.desc = '[L]sp Re[N]ame'
    vim.keymap.set('n', '<leader>ln', function()
      vim.lsp.buf.rename()
    end, opts)

    -- Document highlight
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- Inlay hints toggle
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      opts.desc = '[T]oggle Inlay [H]ints'
      opts.buffer = event.buf
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, opts)
    end

    -- Golang
    opts.desc = '[G]o Ru[N] current project'
    vim.keymap.set('n', '<leader>gn', '<CMD>!go run .<CR>', opts)
    opts.desc = '[G]o [E]rror handle pattern'
    vim.keymap.set('n', '<leader>ge', function()
      local lines = {
        'if err != nil {',
        '    return',
        '}',
      }
      vim.api.nvim_put(lines, 'l', true, true)
      vim.lsp.buf.format()
    end, opts)
  end,
})
