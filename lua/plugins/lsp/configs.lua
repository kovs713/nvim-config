local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/j-hui/fidget.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/pmizio/typescript-tools.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mrcjkb/rustaceanvim' },
    { src = 'https://github.com/adibhanna/laravel.nvim' },
    { src = 'https://github.com/ricardoramirezr/blade-nav.nvim' },
    { src = 'https://github.com/linux-cultist/venv-selector.nvim' },
    { src = 'https://github.com/karloskar/poetry-nvim' },
  }, { confirm = false })

  local capabilities = require('blink.cmp').get_lsp_capabilities()
  local detect = require 'utils.detect'
  local map = vim.keymap.set

  local fidget = require 'fidget'

  fidget.setup {}

  -- vue language server
  local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
  local vtsls_config = {
    capabilities = capabilities,
    filetypes = {
      'vue',
      'typescript',
      'javascript',
      'typescriptreact',
      'javascriptreact',
    },
    root_dir = function(bufnr, on_dir)
      local root = detect.nearest_package_root(bufnr)
      if not detect.is_vue_project(root) then
        return
      end
      on_dir(root)
    end,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      map('n', '<leader>i', function()
        vim.lsp.buf.code_action {
          context = { only = { 'source.organizeImports' } },
          apply = true,
        }
      end, { silent = true, desc = 'Organize [I]mports' })
    end,
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

  -- typescript language server
  local typescript_tools_utils = require 'typescript-tools.utils'
  local typescript_tools = require 'typescript-tools'

  typescript_tools.setup {
    root_dir = function(bufnr, on_dir)
      local root = detect.nearest_package_root(bufnr)
      if detect.is_vue_project(root) then
        return
      end
      map('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS [R]ename [F]ile + Fix Imports' })
      map('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize [I]mports' })
      on_dir(typescript_tools_utils.get_root_dir(bufnr))
    end,
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  }

  -- astro language server
  local astro_ls_config = {
    capabilities = capabilities,
    settings = {
      astro = {
        diagnostic = {
          ignoreRefs = false,
          allowInvalidPeers = true,
        },
        completions = {
          autoImport = true,
          guide = true,
          icons = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    },
    filetypes = { 'astro' },
  }
  vim.lsp.config('astro', astro_ls_config)
  vim.lsp.enable 'astro'

  local svelte_ls_config = {
    capabilities = capabilities,
    settings = {
      astro = {
        diagnostic = {
          ignoreRefs = false,
          allowInvalidPeers = true,
        },
        completions = {
          autoImport = true,
          guide = true,
          icons = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    },
    filetypes = { 'svelte' },
  }
  vim.lsp.config('svelte', svelte_ls_config)
  vim.lsp.enable 'svelte'

  local solidity_ls_config = {
    capabilities = capabilities,
    filetypes = { 'solidity' },
  }
  vim.lsp.config('solidity', solidity_ls_config)
  vim.lsp.enable 'solidity'

  local laravel = require 'laravel'

  vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile', 'FileType' }, {
    pattern = { '<filetype>' },
    callback = function(filetype)
      if filetype == 'php' then
        laravel.setup {
          notifications = true,
          debug = false,
          keymaps = true,
          sail = {
            enabled = true,
            auto_detect = true,
          },
        }
        map('n', '<leader>pa', '', { desc = '[P]hp laravel [A]rtisan' })
        map('n', '<leader>pc', '', { desc = '[P]hp laravel [C]omposer' })
        map('n', '<leader>pr', '', { desc = '[P]hp laravel [R]oute' })
        map('n', '<leader>pm', '', { desc = '[P]hp laravel [M]ake' })
      end
    end,
  })

  local php_ls_config = {
    capabilities = capabilities,
    filetypes = { 'php' },
  }
  vim.lsp.config('intelephense', php_ls_config)
  vim.lsp.enable 'intelephense'

  vim.lsp.config('twiggy_language_server', {
    capabilities = capabilities,
    filetypes = { 'twig' },
  })
  vim.lsp.enable 'twiggy_language_server'

  -- lua language server
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

  -- golang language server
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

  -- html language server
  vim.lsp.enable 'html'

  -- tailwind language server
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

  -- css language server
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

  -- biome language server
  local biome_config = {
    capabilities = capabilities,
    filetypes = {
      'astro',
      'css',
      'graphql',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescriptreact',
      'vue',
    },
    workspace_required = true,
  }
  vim.lsp.config('biome', biome_config)
  vim.lsp.enable 'biome'

  -- json language server
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

  -- python language server
  local venv_selector = require 'venv-selector'
  local poetry_nvim = require 'poetry-nvim'

  local pyright_config = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = 'basic',
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  }
  vim.lsp.config('pyright', pyright_config)
  vim.lsp.enable 'pyright'

  venv_selector.setup {}
  poetry_nvim.setup {}
end

return M
