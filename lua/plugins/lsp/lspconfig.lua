return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  dependencies = {
    { 'antosha417/nvim-lsp-file-operations', config = true },
    'saghen/blink.cmp',
  },
  opts = {
    servers = {
      tsserver = { enabled = false },
      ts_ls = { enabled = false },
      vtsls = { enabled = false },
    },
  },

  config = function()
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
    -- local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
    -- local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    -- local vue_plugin = {
    --   name = '@vue/typescript-plugin',
    --   location = vue_language_server_path,
    --   languages = { 'vue' },
    --   configNamespace = 'typescript',
    -- }
    -- local vtsls_config = {
    --   settings = {
    --     vtsls = {
    --       tsserver = {
    --         globalPlugins = {
    --           vue_plugin,
    --         },
    --       },
    --     },
    --   },
    --   filetypes = tsserver_filetypes,
    -- }
    -- local vue_ls_config = {}
    -- vim.lsp.config('vtsls', vtsls_config)
    -- vim.lsp.enable { 'vtsls', 'vue_ls' }

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
        'vue',
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

    lspconfig.gopls.setup {
      capabilities = capabilities,
      settings = {
        gopls = {
          -- automaticly import packages
          completeUnimported = true,
          -- adds placeholders for functions parameters
          usePlaceholders = true,
          analyses = {
            -- give warning for parameters not used
            unusedparams = true,
          },
        },
      },
      filetypes = {
        'go',
        'gomod',
        'gowork',
        'gotmpl',
      },
    }

    lspconfig.html.setup { capabilities = capabilities }

    local tw_capabilities = require('blink.cmp').get_lsp_capabilities()
    tw_capabilities.textDocument.completion.completionItem.snippetSupport = false
    tw_capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    tw_capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    lspconfig.tailwindcss.setup {
      capabilities = tw_capabilities,
      settings = {
        tailwindCSS = {
          lint = {
            cssConflict = 'warning',
            invalidApply = 'error',
            invalidConfigPath = 'error',
            invalidScreen = 'error',
            invalidTailwindDirective = 'error',
            invalidVariant = 'error',
            recommendedVariantOrder = 'warning',
          },
          experimental = {
            classRegex = {
              'tw`([^`]*)',
              'tw="([^"]*)',
              'tw={"([^"}]*)',
              'tw\\.\\w+`([^`]*)',
              'tw\\(.*?\\)`([^`]*)',
              { 'clsx\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { 'classnames\\(([^)]*)\\)', "'([^']*)'" },
              { 'cva\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
              { 'cn\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            },
          },
          validate = true,
        },
      },
      filetypes = { 'html', 'mdx', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
    }

    lspconfig.cssls.setup {
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end,
      settings = {
        css = {
          lint = {
            unknownAtRules = 'ignore',
          },
        },
        scss = {
          lint = {
            unknownAtRules = 'ignore',
          },
        },
      },
    }

    lspconfig.jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = {
            {
              fileMatch = { 'package.json' },
              url = 'https://json.schemastore.org/package.json',
            },
            {
              fileMatch = { 'tsconfig*.json' },
              url = 'https://json.schemastore.org/tsconfig.json',
            },
            {
              fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
              url = 'https://json.schemastore.org/prettierrc.json',
            },
            {
              fileMatch = { '.eslintrc', '.eslintrc.json' },
              url = 'https://json.schemastore.org/eslintrc.json',
            },
            {
              fileMatch = { '.babelrc', '.babelrc.json', 'babel.config.json' },
              url = 'https://json.schemastore.org/babelrc.json',
            },
            {
              fileMatch = { 'lerna.json' },
              url = 'https://json.schemastore.org/lerna.json',
            },
            {
              fileMatch = { 'now.json', 'vercel.json' },
              url = 'https://json.schemastore.org/now.json',
            },
            {
              fileMatch = { 'ecosystem.json' },
              url = 'https://json.schemastore.org/pm2-ecosystem.json',
            },
          },
        },
      },
    }
  end,
}
