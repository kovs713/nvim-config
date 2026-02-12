return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },

    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
        end

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
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

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local map = vim.keymap.set

    local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
    local vtsls_config = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false

        map('n', '<leader>i', function()
          vim.lsp.buf.code_action {
            apply = true,
            context = {
              only = { 'source.organizeImports' },
              diagnostics = {},
            },
          }
        end, { desc = 'Organize Imports' })
      end,

      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
                configNamespace = 'typescript',
              },
            },
          },
        },
      },
    }
    vtsls_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, vtsls_config.capabilities or {})
    vim.lsp.config('vtsls', vtsls_config)
    vim.lsp.enable 'vtsls'

    -- Configure lua_ls (Lua)
    local lua_ls_config = {
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
              vim.fn.expand '$VIMRUNTIME/lua',
              vim.fn.stdpath 'config' .. '/lua',
              vim.fn.expand '?.lua',
              vim.fn.expand '?/init.lua',
            },
          },
        },
      },
    }
    vim.lsp.config('lua_ls', lua_ls_config)
    vim.lsp.enable 'lua_ls'

    -- emmet_language_server
    local emmet_language_server_config = {
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

    vim.lsp.config('emmet_ls', emmet_language_server_config)
    vim.lsp.enable 'emmet_ls'

    local hints = vim.empty_dict()
    hints.assignVariableTypes = true
    hints.compositeLiteralFields = true
    hints.compositeLiteralTypes = true
    hints.constantValues = true
    hints.functionTypeParameters = true
    hints.parameterNames = true
    hints.rangeVariableTypes = true
    vim.lsp.config('gopls', {
      settings = {
        gopls = {
          codelenses = {
            test = true,
            gc_details = true,
            generate = true,
            run_govulncheck = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          gofumpt = true,
          completeUnimported = true,
          usePlaceholders = false,
          staticcheck = true,
          hints = hints,
          analyses = {
            recursiveiter = true,
            maprange = true,
            framepointer = true,
            modernize = true,
            nilness = true,
            hostport = true,
            gofix = true,
            sigchanyzer = true,
            stdversion = true,
            unreachable = true,
            unusedfunc = true,
            unusedparams = true,
            unusedvariable = true,
            unusedwrite = true,
            useany = true,
          },
        },
      },
    })
    vim.lsp.enable 'gopls'

    vim.lsp.enable 'html'

    local tw_capabilities = require('blink.cmp').get_lsp_capabilities()
    tw_capabilities.textDocument.completion.completionItem.snippetSupport = false
    tw_capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    tw_capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local tailwindcss_config = {
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
    vim.lsp.config('tailwindcss', tailwindcss_config)
    vim.lsp.enable 'tailwindcss'

    local cssls_config = {
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
    vim.lsp.config('cssls', cssls_config)
    vim.lsp.enable 'cssls'

    local jsonls_config = {
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
    vim.lsp.config('jsonls', jsonls_config)
    vim.lsp.enable 'jsonls'

    vim.lsp.config('pyright', {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = 'basic',
            diagnosticMode = 'openFilesOnly',
          },
        },
      },
    })
    vim.lsp.enable 'pyright'
  end,
}
