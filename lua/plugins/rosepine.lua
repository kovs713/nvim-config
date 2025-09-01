return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    vim.cmd 'colorscheme rose-pine'
  end,
  opts = {
    disable_italics = true,
    highlight_groups = {
      Comment = { italic = false },
      ['@comment'] = { italic = false },
      ['@keyword'] = { italic = false },
      ['@type'] = { italic = false },
    },
  },
}
