return {
  { 'roobert/tailwindcss-colorizer-cmp.nvim' },
  {
    'NvChad/nvim-colorizer.lua',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
    config = function()
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
    end,
  },
}
