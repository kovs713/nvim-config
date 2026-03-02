return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scroll = {
      enabled = false,
    },
    picker = {
      enabled = true,
      ui_select = true,
      matcher = {
        fuzzy = true,
        smartcase = true,
        ignorecase = true,
        frecency = true,
        cwd_bonus = true,
      },

      layout = {
        preview = 'main',
        layout = {
          backdrop = false,
          width = 40,
          min_width = 40,
          height = 0,
          position = 'left',
          border = 'none',
          box = 'vertical',
          {
            win = 'input',
            height = 1,
            border = 'single',
            title = '{title} {live} {flags}',
            title_pos = 'center',
          },
          { win = 'list', border = 'none' },
          { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
        },
      },

      sources = {
        files = {
          filter = {
            paths = {
              ['^%.node_modules/'] = false,
              ['^dist/'] = false,
              ['^build/'] = false,
            },
          },
        },
        grep = {
          filter = {
            paths = {
              ['^%.node_modules/'] = false,
              ['^dist/'] = false,
              ['^build/'] = false,
            },
            binary = false,
          },
        },
      },
    },

    image = {
      enabled = true,
      doc = {
        float = true,
        inline = true,
        max_width = 40,
        max_height = 20,
        wo = {
          wrap = false,
        },
      },
      convert = {
        notify = true,
        command = 'magick',
      },
      img_dirs = { 'img', 'images', 'assets', 'static', 'public', 'media', 'attachments', 'archives/all-vault-images/', '~/downloads' },
    },
  },

  keys = {
    {
      '<leader>gl',
      function()
        Snacks.lazygit()
      end,
      desc = '[F]loat [L]azygit',
    },
    {
      '<leader>rN',
      function()
        Snacks.rename.rename_file()
      end,
      desc = '[R]ename [F]ile',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[F]ind [P]rojects',
    },
    {
      '<leader>fu',
      function()
        Snacks.picker.undo()
      end,
      desc = '[F] [U]ndo tree',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.grep()
      end,
      desc = '[F]ind by Grep [D]',
    },
    {
      '<leader>fo',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[F]ind Buffers [O]',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = '[F]ind [R]ecent File',
    },

    -- 🗂 Git
    {
      '<leader>fc',
      function()
        Snacks.picker.git_log()
      end,
      desc = '[F]ind Git [C]ommits',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = '[F]ind Git [B]ranches',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[F]ind Git [S]tatus',
    },
    {
      '<leader>ft',
      function()
        Snacks.picker.git_stash()
      end,
      desc = '[F]ind Git S[t]ash',
    },
  },
}
