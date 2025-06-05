return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'echasnovski/mini.icons',
  },
  opts = {
    workspaces = {
      {
        name = 'main',
        path = '~/obsidian/mainVault/',
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

    mappings = {
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { desc = '[G]oto markdown [F]ile', noremap = false, expr = true, buffer = true },
      },

      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },

      ['<leader>ox'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { desc = '[O]bsidian toggle checkbo[X]' },
      },

      ['<leader>od'] = {
        action = '<CMD>Obsidian dailies<CR>',
        opts = { desc = '[O]bsidian open [D]ailies menu' },
      },

      ['<leader>ont'] = {
        action = '<CMD>Obsidian today<CR>',
        opts = { desc = '[O]bsidian [N]ew [T]oday note' },
      },

      ['<leader>ony'] = {
        action = '<CMD>Obsidian yesterday<CR>',
        opts = { desc = '[O]bsidian [N]ew [Y]esterday note' },
      },

      ['<leader>onn'] = {
        action = '<CMD>Obsidian new<CR>',
        opts = { desc = '[O]bsidian [N]ew [N]ote' },
      },

      ['<leader>os'] = {
        action = '<CMD>Obsidian search<CR>',
        opts = { desc = '[O]bsidian [S]earch notes' },
      },
    },

    picker = {
      name = 'fzf-lua',
      note_mappings = {

        new = '<C-n>',
        insert_link = '<C-p>',
      },
    },
  },
}
