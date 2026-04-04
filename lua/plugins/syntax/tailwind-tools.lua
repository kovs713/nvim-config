local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/roobert/tailwindcss-colorizer-cmp.nvim' },
    { src = 'https://github.com/norcalli/nvim-colorizer.lua' },
  }, { confirm = false })

  local colorizer = require 'colorizer'
  local tailwind_cmp = require 'tailwindcss-colorizer-cmp'

  colorizer.setup {
    options = {
      tailwind = true,
    },
    filetypes = { 'html', 'css' },
  }

  tailwind_cmp.setup {
    color_square_width = 2,
  }
end

return M
