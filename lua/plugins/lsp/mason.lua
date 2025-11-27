return {
  'mason-org/mason.nvim',
  lazy = false,
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'neovim/nvim-lspconfig',
    'saghen/blink.cmp',
  },
  config = function()
    -- import mason and mason_lspconfig
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      automatic_enable = false,
      -- servers for mason to install
      ensure_installed = {
        'lua_ls',
        'html',
        'cssls',
        'tailwindcss',
        'gopls',
        'emmet_ls',
        'emmet_language_server',
        'eslint',
        'marksman',
        'gofumtl',
        'jsonls',
        'yamlls',
      },
    }

    local function ts_clients(filter)
      filter = filter or {}
      filter.name = 'typescript-tools'
      return vim.lsp.get_clients(filter)
    end

    vim.api.nvim_create_user_command('TSBufRestart', function()
      local cs = ts_clients { bufnr = 0 }
      if #cs == 0 then
        vim.notify('В этом буфере нет клиента typescript-tools', vim.log.levels.WARN)
        return
      end
      for _, c in ipairs(cs) do
        pcall(vim.cmd, { cmd = 'LspRestart', args = { tostring(c.id) } })
      end
    end, {})

    vim.api.nvim_create_user_command('TSRestart', function()
      local cs = ts_clients()
      if #cs == 0 then
        vim.notify(
          'Нет активных клиентов typescript-tools. Открой .ts/.tsx/.js файл и попробуй снова.',
          vim.log.levels.WARN
        )
        return
      end
      for _, c in ipairs(cs) do
        pcall(vim.cmd, { cmd = 'LspRestart', args = { tostring(c.id) } })
      end
    end, {})

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        -- { 'eslint_d', version = '13.1.2' },
      },
    }
  end,
}
