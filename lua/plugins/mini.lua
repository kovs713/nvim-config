return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.icons').setup {
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
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.indentscope').setup()
    require('mini.cursorword').setup()
  end,
}
