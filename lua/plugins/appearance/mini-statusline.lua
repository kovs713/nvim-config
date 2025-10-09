return {
  'nvim-mini/mini.statusline',
  version = false,
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'neo-tree',
      callback = function()
        vim.b.ministatusline_disable = true
      end,
    })

    local statusline = require 'mini.statusline'
    statusline.setup {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local git = MiniStatusline.section_git { trunc_width = 40 }
          local diff = MiniStatusline.section_diff { trunc_width = 75 }
          local diag = MiniStatusline.section_diagnostics { trunc_width = 75 }
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          local filetype = MiniStatusline.section_fileinfo { trunc_width = 120 }
          local time = os.date '%R'

          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diff } },
            '%<',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineFileinfo', strings = { diag } },
          }
        end,

        inactive = function()
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          return MiniStatusline.combine_groups {
            { hl = 'MiniStatuslineFilename', strings = { filename } },
          }
        end,
      },
      use_icons = true,
    }
  end,
}
