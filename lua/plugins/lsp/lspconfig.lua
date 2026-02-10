return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
  },

  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities() -- Import capabilities from blink.cmp

    -- bullshit
    -- local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
    -- local vtsls_config = {
    --   settings = {
    --     vtsls = {
    --       tsserver = {
    --         globalPlugins = {
    --           {
    --             name = '@vue/typescript-plugin',
    --             location = vue_language_server_path,
    --             languages = { 'vue' },
    --             configNamespace = 'typescript',
    --           },
    --         },
    --       },
    --     },
    --   },
    --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    -- }
    -- vim.lsp.config('vtsls', vtsls_config)
    -- vim.lsp.enable 'vtsls'

    -- Configure lua_ls (Lua)
    local lua_ls_config = {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'bit',
              'colors',
              'colours',
              'commands',
              'disk',
              'fs',
              'gps',
              'help',
              'http',
              'keys',
              'multishell',
              'paintutils',
              'parallel',
              'peripheral',
              'pocket',
              'rednet',
              'redstone',
              'rs',
              'settings',
              'shell',
              'term',
              'textutils',
              'turtle',
              'vector',
              'window',
              '_CC_DEFAULT_SETTINGS',
              '_HOST',
              'printError',
              'write',
              'read',
              'sleep',
            },
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
              vim.fn.expand '~/.luarocks/lib/luarocks/rocks-5.4/?.lua',
              vim.fn.expand '~/.luarocks/lib/luarocks/rocks-5.4/?/init.lua',
              vim.fn.expand '/usr/share/5.3/?.lua',
              vim.fn.expand '/usr/share/lua/5.3/?/init.lua',
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
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = { 'pyproject.toml', '.git' },
    })

    vim.lsp.enable 'pyright'

    -- local eslint_config = {
    --   capabilities = capabilities,
    --   settings = {
    --     useESLintClass = false,
    --     validate = 'on',
    --     problems = {
    --       shortenToSingleLine = false,
    --     },
    --     workingDirectory = {
    --       mode = 'auto',
    --     },
    --     codeAction = {
    --       disableRuleComment = {
    --         enable = true,
    --         location = 'separateLine',
    --       },
    --       showDocumentation = {
    --         enable = true,
    --       },
    --     },
    --   },
    -- }
  end,
}
