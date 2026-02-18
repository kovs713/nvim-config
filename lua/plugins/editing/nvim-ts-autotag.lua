return {
  'windwp/nvim-ts-autotag',
  ft = {
    'html',
    'tsx',
    'jsx',
    'javascriptreact',
    'typescriptreact',
    'svelte',
    'vue',
  },
  config = function()
    local autotag = require 'nvim-ts-autotag'
    autotag.setup {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    }
  end,
}
