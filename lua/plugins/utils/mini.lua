local M = {}

function M.setup()
  vim.pack.add {'https://github.com/nvim-mini/mini.nvim'}
  vim.cmd.packadd 'mini.nvim'

  local mini_ai = require 'mini.ai'
  local mini_icons = require 'mini.icons'
  local mini_surround = require 'mini.surround'
  local mini_pairs = require 'mini.pairs'
  local mini_indentscope = require 'mini.indentscope'
  local mini_cursorword = require 'mini.cursorword'

  mini_ai.setup { n_lines = 500 }

  mini_icons.setup {
    icons = {
      File = '󰈙',
      Folder = '󰉋',
      Module = '󰌗',
      Namespace = '󰌗',
      Package = '󰏖',
      Class = '󰌗',
      Method = '󰆧',
      Property = '󰜢',
      Field = '󰜢',
      Constructor = '󰆧',
      Enum = '󰕘',
      Interface = '󰕘',
      Function = '󰊕',
      Variable = '󰀫',
      Constant = '󰏿',
      String = '󰀬',
      Number = '󰎠',
      Boolean = '󰔨',
      Array = '󰅪',
      Object = '󰅩',
      Key = '󰌋',
      Null = '󰟢',
    },
  }

  mini_surround.setup()

  mini_pairs.setup()

  mini_indentscope.setup()

  mini_cursorword.setup()
end

return M
