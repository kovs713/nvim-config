return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
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
    },
    keys = {
      {
        '<leader>fl',
        function()
          require('snacks').lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gl',
        function()
          require('snacks').lazygit.log()
        end,
        desc = 'Lazygit logs',
      },
      {
        '<leader>rN',
        function()
          require('snacks').rename.rename_file()
        end,
        desc = 'Rename file',
      },
      {
        '<leader>fp',
        function()
          require('snacks.picker').projects()
        end,
        desc = 'Find projects',
      },
    },
  },
}
