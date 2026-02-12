return {
  'NStefan002/screenkey.nvim',
  lazy = false,
  version = '*',
  config = function()
    local screenkey = require 'screenkey'
    local notify = require 'notify'
    local function toggleScreenKey()
      vim.cmd 'Screenkey toggle'

      notify.setup {
        top_down = screenkey.is_active(),
      }
    end

    vim.keymap.set('n', '<leader>ts', toggleScreenKey, { desc = '[T]oggle [S]creen[K]ey' })
  end,
}
