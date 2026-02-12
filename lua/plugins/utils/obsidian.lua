return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-mini/mini.icons',
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = 'main',
        path = '~/obsidian-vault/',
      },
    },

    -- couse of render-markdown.nvim
    ui = { enable = false },

    daily_notes = {
      folder = 'dailies',
      date_format = 'daily note: %d.%m.%Y',
      default_tags = { 'daily-notes' },
      template = nil,
    },

    new_notes_location = 'current_dir',
    completion = {
      nvim_cmp = false,
      -- GOAT
      blank = true,
      min_chars = 2,
    },

    picker = {
      name = 'fzf-lua',
      note_mappings = {

        new = '<C-n>',
        insert_link = '<C-p>',
      },
    },
    keys = {
      { '<leader>od', '<cmd>Obsidian dailies<cr>', desc = '[O]bsidian [D]ailies' },
      { '<leader>ont', '<cmd>Obsidian today<cr>', desc = '[O]bsidian [N]ew [T]oday' },
      { '<leader>ony', '<cmd>Obsidian yesterday<cr>', desc = '[O]bsidian [N]ew [Y]esterday' },
      { '<leader>ony', '<cmd>Obsidian yesterday<cr>', desc = '[O]bsidian [N]ew [Y]esterday' },
      { '<leader>os', '<cmd>Obsidian search<cr>', desc = '[O]bsidian [S]earch' },
    },

    config = function()
      local obsidian = require 'obsidian'

      vim.keymap.set('n', 'gf', function()
        return obsidian.util.gf_passthrough()
      end, { desc = '[G]oto markdown [F]ile', noremap = false, expr = true })

      vim.keymap.set('n', '<CR>', function()
        return obsidian.util.smart_action()
      end, { expr = true, desc = 'Obsidian smart action' })

      vim.keymap.set('n', '<Tab>', function()
        require('obsidian.api').nav_link 'next'
      end, { desc = 'Go to next link' })

      vim.keymap.set('n', '<S-Tab>', function()
        require('obsidian.api').nav_link 'prev'
      end, { desc = 'Go to previous link' })
    end,
  },
}
