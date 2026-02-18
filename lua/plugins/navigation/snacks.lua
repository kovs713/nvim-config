return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    scroll = {
      enabled = false,
    },
    picker = {
      matchers = {
        frecency = true,
        cwd_bonus = true,
      },
      formatters = {
        file = {
          filename_first = false,
          filename_only = false,
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
        require('snacks').lazygit()
      end,
      desc = '[F]loat [L]azygit',
    },
    {
      '<leader>rN',
      function()
        require('snacks').rename.rename_file()
      end,
      desc = '[R]ename [F]ile',
    },
    {
      '<leader>fp',
      function()
        require('snacks.picker').projects()
      end,
      desc = '[F]ind [P]rojects',
    },
    {
      '<leader>fu',
      function()
        require('snacks.picker').undo()
      end,
      desc = '[F] [U]ndo tree',
    },
  },
}
