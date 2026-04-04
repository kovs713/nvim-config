local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  }, { confirm = false })

  local render_markdown = require 'render-markdown'

  render_markdown.setup {
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
  }
end

return M
