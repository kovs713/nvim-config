return {
  'NStefan002/screenkey.nvim',
  lazy = false,
  version = '*',
  config = function()
    local function toggleScreenKey()
      vim.cmd 'Screenkey toggle'
    end

    vim.keymap.set('n', '<leader>ts', toggleScreenKey, { desc = '[T]oggle [S]creen[K]ey' })
  end,
}
