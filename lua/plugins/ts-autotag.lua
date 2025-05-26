return {
  'windwp/nvim-ts-autotag',
  config = function()
    local ts_autotag = require 'nvim-ts-autotag'
    ts_autotag.setup {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_stash = true,
      },
    }
  end,
  event = 'VeryLazy',
}
