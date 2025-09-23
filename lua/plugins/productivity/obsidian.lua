return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'echasnovski/mini.icons',
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
    callbacks = {
      enter_note = function(_, note)
        local bufnr = note.bufnr
        local obsidian = require 'obsidian'

        pcall(vim.keymap.del, 'n', '<CR>', { buffer = bufnr })

        vim.keymap.set('n', '<leader>od', '<cmd>Obsidian dailies<cr>', { buffer = bufnr, desc = '[O]bsidian [D]ailies' })
        vim.keymap.set('n', '<leader>ont', '<cmd>Obsidian today<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [T]oday' })
        vim.keymap.set('n', '<leader>ony', '<cmd>Obsidian yesterday<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [Y]esterday' })
        vim.keymap.set('n', '<leader>onn', '<cmd>Obsidian new<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [N]ote' })
        vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<cr>', { buffer = bufnr, desc = '[O]bsidian [S]earch' })

        -- gf: passthrough
        vim.keymap.set('n', 'gf', function()
          return obsidian.util.gf_passthrough()
        end, { buffer = bufnr, desc = '[G]oto markdown [F]ile', noremap = false, expr = true })

        -- Smart action на <CR> (если хочешь оставить — просто раскомментируй)
        vim.keymap.set("n", "<CR>", function()
          return obsidian.util.smart_action()
        end, { buffer = bufnr, expr = true, desc = "Obsidian smart action" })

        vim.keymap.set('n', '<Tab>', function()
          require('obsidian.api').nav_link 'next'
        end, { buffer = bufnr, desc = 'Go to next link' })

        vim.keymap.set('n', '<S-Tab>', function()
          require('obsidian.api').nav_link 'prev'
        end, { buffer = bufnr, desc = 'Go to previous link' })
      end,
    },
  },
}
