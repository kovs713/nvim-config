local M = {}

function M.setup()
  vim.pack.add {'https://github.com/windwp/nvim-ts-autotag'}
  vim.cmd.packadd 'nvim-ts-autotag'

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'html',
      'tsx',
      'jsx',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
    },
    callback = function()
      local autotag = require 'nvim-ts-autotag'

      autotag.setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  })
end

return M
