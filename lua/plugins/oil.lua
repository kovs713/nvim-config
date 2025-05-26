return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons', opts = {} },

  config = function()
    local oil = require 'oil'

    oil.setup {
      default_file_explorer = true,
      columns = {},
      keymaps = {
        ['q'] = 'actions.close',
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    }
    vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open Oil file explorer' })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        vim.opt_local.cursorline = true
      end,
    })
  end,

  lazy = false,
}
