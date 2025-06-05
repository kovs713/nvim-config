return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.icons',
  },
  ---@module 'render-markdown'
  ft = { 'markdown', 'norg', 'rmd', 'org' },
  opts = {
    heading = {
      sign = false,
      icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
    },
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    bullet = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
      position = 'inline',
      unchecked = {
        icon = '   󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
        scope_highlight = nil,
      },
      checked = {
        icon = '   󰱒 ',
        highlight = 'RenderMarkdownChecked',
        scope_highlight = nil,
      },
    },
  },
}
