return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>ef', '<cmd>Neotree toggle float<CR>', { desc = 'Open Nvim-Neo-Tree floating' })
    vim.keymap.set('n', '<leader>er', '<cmd>Neotree toggle position=right<CR>', { desc = 'Open Nvim-Neo-Tree on the right' })
    vim.keymap.set('n', '<leader>ee', '<cmd>Neotree<CR>', { desc = 'Open Nvim-Neo-Tree' })
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'single',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,

      window = {
        position = 'float',
        width = 30,
        mappings = {
          ['h'] = 'close_node',
          ['l'] = 'open',
        },
      },

      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = ' ',
          highlight = 'NeoTreeModified',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          folder_empty_open = '',
        },
        git_status = {
          symbols = {
            added = '',
            deleted = '',
            modified = '',
            renamed = '',
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
      },

      source_selector = {
        winbar = true,
        sources = {
          { source = 'filesystem', display_name = '   Files ' },
          { source = 'buffers', display_name = '   Bufs ' },
          { source = 'git_status', display_name = '   Git ' },
        },
      },

      filesystem = {
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          visible = true,
          hide_by_name = {
            'node_modules',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
    }
  end,
}
