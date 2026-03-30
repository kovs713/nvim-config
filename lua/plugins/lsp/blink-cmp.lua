local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/L3MON4D3/LuaSnip' }
  vim.cmd.packadd 'LuaSnip'
  vim.cmd.packadd 'friendly-snippets'
  vim.cmd.packadd 'lazydev.nvim'
  vim.cmd.packadd 'blink-emoji.nvim'
  vim.pack.add { 'https://github.com/brenoprata10/nvim-highlight-colors' }
  vim.cmd.packadd 'blink.cmp'
  vim.cmd.packadd 'nvim-highlight-colors'

  local luasnip = require 'luasnip'

  luasnip.setup {}

  local luasnip_loaders_from_vscode = require 'luasnip.loaders.from_vscode'

  luasnip_loaders_from_vscode.lazy_load()

  local blink_cmp = require 'blink.cmp'

  local nvim_highlight_colors = require 'nvim-highlight-colors'

  blink_cmp.setup {
    keymap = {
      preset = 'default',
      ['C-space'] = { 'show_and_insert' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = {
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },

    completion = {
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if ctx.item.source_name == 'LSP' then
                  local color_item = nvim_highlight_colors.format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= '' then
                    icon = color_item.abbr
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local highlight = 'BlinkCmpKind' .. ctx.kind
                if ctx.item.source_name == 'LSP' then
                  local color_item = nvim_highlight_colors.format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    highlight = color_item.abbr_hl_group
                  end
                end
                return highlight
              end,
            },
          },
        },
        auto_show = true,
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = {
        enabled = true,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer', 'emoji' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 15,
          opts = { insert = true },
          should_show_items = function()
            return vim.tbl_contains({ 'gitcommit', 'markdown' }, vim.o.filetype)
          end,
        },
      },
    },

    snippets = { preset = 'luasnip' },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  }
end

return M
