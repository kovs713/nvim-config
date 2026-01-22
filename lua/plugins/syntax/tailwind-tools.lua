return {
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    {
      'NvChad/nvim-colorizer.lua',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      opts = {},
      config = function()
        local nvchadcolorizer = require 'colorizer'
        local tailwindcolorizer = require 'tailwindcss-colorizer-cmp'

        nvchadcolorizer.setup {
          user_default_options = {
            tailwind = true,
          },
          filetypes = { 'html', 'css' },
        }

        tailwindcolorizer.setup {
          color_square_width = 2,
        }

        vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile', 'FileType' }, {
          pattern = { '<filetype>' },
          callback = function(filetype)
            if filetype == 'css' or filetype == 'html' then
              vim.cmd 'ColorizerAttachToBuffer'
            end
          end,
        })
      end,
    },
  },
}
