return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      terminal_colors = true,
      contrast = 'soft',
      transparent_mode = true,
    }
    -- vim.o.background = "light"
    vim.cmd 'colorscheme gruvbox'
  end,
}
