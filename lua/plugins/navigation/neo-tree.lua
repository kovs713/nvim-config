return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-mini/mini.icons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>ef', '<cmd>Neotree toggle position=right<CR>', { desc = 'Open Neo-Tree [E]xplorer on the [R]ight' })
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'single',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,

      window = {
        position = 'right',
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

      -- source_selector = {
      -- winbar = true,
      -- sources = {
      --   { source = 'filesystem', display_name = '   Files ' },
      --   { source = 'buffers', display_name = '   Bufs ' },
      --   { source = 'git_status', display_name = '   Git ' },
      -- },
      -- },

      filesystem = {
        -- group_empty_dirs = true,
        group_empty_dirs = false,
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
