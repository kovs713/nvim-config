return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = { 'saghen/blink.cmp', { 'antosha417/nvim-lsp-file-operations', config = true } },
  opts = {
    servers = {
      tsserver = { enabled = false },
      ts_ls = { enabled = false },
      vtsls = { enabled = false },
    },
  },

  config = function()
    -- NOTE: LSP Keybinds
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings
        -- Check `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'See available code actions'
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', function()
          require('fzf-lua').lsp_code_actions()
        end, opts) -- see available code actions, in visual mode will apply to selection

        vim.keymap.set({ 'n', 'v' }, '<leader>ll', '<cmd>LspRestart<CR>', opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = '[L]sp [I]mplimentations'
        vim.keymap.set('n', '<leader>li', function()
          require('fzf-lua').lsp_implementations()
        end, opts)

        opts.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

        vim.keymap.set('i', '<C-h>', function()
          vim.lsp.buf.signature_help()
        end, opts)
      end,
    })

    -- Define sign icons for each severity
    local signs = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰠠 ',
      [vim.diagnostic.severity.INFO] = ' ',
    }

    -- Set the diagnostic config with all icons
    vim.diagnostic.config {
      signs = {
        text = signs, -- Enable signs in the gutter
      },
      virtual_text = true, -- Specify Enable virtual text for diagnostics
      underline = true, -- Specify Underline diagnostics
      update_in_insert = false, -- Keep diagnostics active in insert mode
    }

    -- Setup servers
    local capabilities = require('blink.cmp').get_lsp_capabilities() -- Import capabilities from blink.cmp
    local lspconfig = require 'lspconfig'

    -- Configure tsserver (TypeScript and JavaScript and VueJS)
    -- local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
    -- lspconfig.ts_ls.setup {
    --   capabilities = capabilities,
    --   root_dir = function(fname)
    --     local util = lspconfig.util
    --     return not util.root_pattern('deno.json', 'deno.jsonc')(fname) and util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')(fname)
    --   end,
    --   single_file_support = false,
    --   on_attach = function(client, bufnr)
    --     -- Disable formatting if you're using a separate formatter like Prettier
    --     client.server_capabilities.documentFormattingProvider = false
    --   end,
    --   init_options = {
    --     plugins = {
    --       {
    --         name = '@vue/typescript-plugin',
    --         location = vue_language_server_path,
    --         languages = { 'vue' },
    --       },
    --     },
    --     preferences = {
    --       includeCompletionsWithSnippetText = true,
    --       includeCompletionsForImportStatements = true,
    --     },
    --   },
    --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    -- }

    -- Configure lua_ls (Lua)
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          completion = {
            callSnippet = 'Replace',
          },
          workspace = {
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
        },
      },
    }

    -- emmet_ls ()
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      filetypes = {
        'html',
        'typescriptreact',
        'javascriptreact',
        'css',
        'sass',
        'scss',
        'less',
        'svelte',
      },
    }

    -- emmet_language_server
    lspconfig.emmet_language_server.setup {
      capabilities = capabilities,
      filetypes = {
        'css',
        'eruby',
        'html',
        'javascript',
        'javascriptreact',
        'less',
        'sass',
        'scss',
        'pug',
        'typescriptreact',
      },
      init_options = {
        includeLanguages = {},
        excludeLanguages = {},
        extensionsPath = {},
        preferences = {},
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = 'always',
        showSuggestionsAsSnippets = false,
        syntaxProfiles = {},
        variables = {},
      },
    }

    -- Add other LSP servers as needed, e.g., gopls, eslint, html, etc.
    lspconfig.gopls.setup { capabilities = capabilities }
    lspconfig.html.setup { capabilities = capabilities }
    lspconfig.cssls.setup { capabilities = capabilities }
    lspconfig.yaml.setup {
      capabilities = capabilities,
      filetypes = { 'yml' },
    }
    lspconfig.prisma.setup {
      capabilities = capabilities,
      filetypes = { 'prisma' },
    }
  end,
}
