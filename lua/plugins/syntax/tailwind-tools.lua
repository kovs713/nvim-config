local M = {}

function M.setup()
  vim.cmd.packadd 'tailwindcss-colorizer-cmp.nvim'
  vim.cmd.packadd 'nvim-treesitter'
  vim.cmd.packadd 'nvim-colorizer.lua'

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
