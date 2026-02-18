return {
  'neanias/everforest-nvim',
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    local everforest = require 'everforest'

    everforest.setup {
      background = 'hard',
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
      inlay_hints_background = 'dimmed',
      on_highlights = function(hl, palette)
        hl['@string.special.symbol.ruby'] = { link = '@field' }
        hl['DiagnosticUnderlineWarn'] = { undercurl = true, sp = palette.yellow }
      end,
    }

    everforest.load()
  end,
}
