local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim' },
    { src = 'https://github.com/neanias/everforest-nvim' },
    { src = 'https://github.com/ficcdaf/ashen.nvim' },
    { src = 'https://github.com/kepano/flexoki-neovim' },
  }, { confirm = false })

  -- -- rose-pine
  -- local rose_pine = require 'rose-pine'

  -- rose_pine.setup {}
  -- vim.cmd.colorscheme 'rose-pine'

  -- -- ashen
  -- local ashen = require 'ashen'
  -- ashen.setup {}
  -- ashen.load()

  -- -- milkmatcha
  -- vim.cmd.colorscheme 'milkmatcha'

  -- monochrome
  vim.cmd.colorscheme 'monochrome'

  -- -- flexoki light
  -- vim.cmd.colorscheme 'flexoki-light'

  -- -- everforest light
  -- local everforest = require 'everforest'
  -- everforest.setup {
  --   background = 'light',
  --   transparent_background_level = 0,
  --   italics = true,
  --   disable_italic_comments = false,
  --   inlay_hints_background = 'dimmed',
  --   on_highlights = function(hl, palette)
  --     hl['@string.special.symbol.ruby'] = { link = '@field' }
  --     hl['DiagnosticUnderlineWarn'] = { undercurl = true, sp = palette.yellow }
  --   end,
  -- }
  -- everforest.load()
end

return M
