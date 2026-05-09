local statusline = require 'mini.statusline'

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
  end

  return vim.fn.fnamemodify(filepath, ':~:.')
end

local mode_hl = {
  n = 'MiniStatuslineModeNormal',
  no = 'MiniStatuslineModeNormal',
  ni = 'MiniStatuslineModeNormal',
  niI = 'MiniStatuslineModeNormal',
  niR = 'MiniStatuslineModeNormal',
  niV = 'MiniStatuslineModeNormal',
  i = 'MiniStatuslineModeInsert',
  ic = 'MiniStatuslineModeInsert',
  ix = 'MiniStatuslineModeInsert',
  v = 'MiniStatuslineModeVisual',
  V = 'MiniStatuslineModeVisual',
  ['v^V'] = 'MiniStatuslineModeVisual',
  s = 'MiniStatuslineModeVisual',
  S = 'MiniStatuslineModeVisual',
  ['s^S'] = 'MiniStatuslineModeVisual',
  R = 'MiniStatuslineModeReplace',
  Rc = 'MiniStatuslineModeReplace',
  Rv = 'MiniStatuslineModeReplace',
  Rx = 'MiniStatuslineModeReplace',
  c = 'MiniStatuslineModeCommand',
  cv = 'MiniStatuslineModeCommand',
  ce = 'MiniStatuslineModeCommand',
  r = 'MiniStatuslineModeInsert',
  rm = 'MiniStatuslineModeInsert',
  ['r?'] = 'MiniStatuslineModeInsert',
  ['!'] = 'MiniStatuslineModeCommand',
  t = 'MiniStatuslineModeCommand',
}

local function get_mode_hl(mode)
  return mode_hl[mode] or 'MiniStatuslineModeNormal'
end

statusline.setup {
  content = {
    active = function()
      local mode, _ = MiniStatusline.section_mode { trunc_width = 100 }
      local mode_name = get_mode_hl(mode)
      local path = get_relative_path()
      local git = MiniStatusline.section_git { trunc_width = 40 }

      return MiniStatusline.combine_groups {
        { hl = mode_name, strings = { mode } },
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
