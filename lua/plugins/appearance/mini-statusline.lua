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

    local function get_relative_path()
      local filepath = vim.fn.expand '%:p'
      if filepath == '' or not vim.fn.filereadable(filepath) then
        return '[No Name]'
      end

      local cwd = vim.fn.getcwd()
      if cwd:sub(-1) ~= '/' then
        cwd = cwd .. '/'
      end

      if filepath:sub(1, #cwd) == cwd then
        return filepath:sub(#cwd + 1)
      else
        -- fallback: relative to home or full path
        return vim.fn.fnamemodify(filepath, ':~:.')
      end
    end

    local statusline = require 'mini.statusline'
    statusline.setup {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 100 }
          local path = get_relative_path()
          local git = MiniStatusline.section_git { trunc_width = 40 }

          return MiniStatusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineFilename', strings = { path } },
            { hl = 'MiniStatuslineDevinfo', strings = { git } },
          }
        end,

        inactive = function()
          local path = get_relative_path()
          return MiniStatusline.combine_groups {
            { hl = 'MiniStatuslineFilename', strings = { path } },
          }
        end,
      },
      use_icons = true,
    }
  end,
}
