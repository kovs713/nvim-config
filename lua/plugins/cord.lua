return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    event = 'VeryLazy',
    opts = function()
      vim.filetype.add {
        pattern = {
          ['.*/.*%.module%.ts'] = 'typescript',
          ['.*/.*%.controller%.ts'] = 'typescript',
          ['.*/.*%.service%.ts'] = 'typescript',
        },
      }
      vim.keymap.set('n', '<leader>ct', function()
        require('cord.api.command').toggle_presence()
      end)
      -- {desc: "Toogle cord presence"}
      vim.keymap.set('n', '<leader>ci', function()
        require('cord.api.command').toggle_idle_force()
      end)
      -- {desc: "Toogle cord idle"}
      vim.keymap.set('n', '<leader>cu', function()
        require('cord.api.command').update()
      end)
      -- {desc: "Update cord"}
      return {
        enabled = true,
        log_level = vim.log.levels.OFF,

        editor = {
          client = 'neovim',
          tooltip = 'череп эмодзи 💀',
        },

        display = {
          theme = 'default',
          flavor = 'accent',
          view = 'full',
          swap_fields = false,
          swap_icons = false,
        },

        timestamp = {
          enabled = true,
          reset_on_idle = false,
          reset_on_change = false,
          shared = false,
        },

        idle = {
          enabled = true,
          timeout = 5 * 60 * 1000,
          show_status = true,
          ignore_focus = true,
          unidle_on_focus = true,
          smart_idle = true,
          tooltip = '💤',
        },

        text = {
          default = nil,
          workspace = function(opts)
            return opts.workspace and ('Working on ' .. opts.workspace) or 'Working on smth'
          end,
          viewing = function(opts)
            return 'Looking for ' .. opts.filename
          end,
          editing = function(o)
            return ('Editing %s'):format(o.filename)
          end,
          dashboard = 'Home',
        },

        -- buttons = {
        --   {
        --     label = function(opts)
        --       return opts.repo_url and 'Open the repository' or nil
        --     end,
        --     url = function(opts)
        --       return opts.repo_url
        --     end,
        --   },
        -- },

        assets = vim.tbl_extend('force', (assets or {}), {
          ['.ts'] = { icon = require('cord.api.icon').get 'typescript', tooltip = 'TypeScript', type = 'language' },
          ['.tsx'] = { icon = require('cord.api.icon').get 'typescript', tooltip = 'TypeScript React', type = 'language' },

          lazy = {
            name = 'Lazy',
            type = 'plugin_manager',
            tooltip = 'lazy.nvim plugin manager',
          },
        }),

        variables = true,

        hooks = vim.tbl_extend('force', (hooks or {}), {
          post_activity = function(opts, activity)
            local v = vim.version()
            activity.assets.small_text = string.format('Neovim %d.%d.%d', v.major, v.minor, v.patch)

            local f = opts.filename or ''
            if
              f:match '%.module%.ts$'
              or f:match '%.controller%.ts$'
              or f:match '%.service%.ts$'
              or f:match '%.guard%.ts$'
              or f:match '%.interceptor%.ts$'
              or f:match '%.gateway%.ts$'
              or f:match '%.filter%.ts$'
              or f:match '%.resolver%.ts$'
            then
              activity.assets.large_image = require('cord.api.icon').get 'typescript'
              activity.assets.large_text = 'NestJS'
            end
          end,
        }),

        plugins = {
          -- ['cord.plugins.diagnostics'] = {
          --   scope = 'buffer',
          --   severity = { min = vim.diagnostic.severity.WARN },
          --   override = true,
          -- },
          -- ['cord.plugins.scoped_timestamps'] = {
          --   scope = 'workspace',
          --   pause = true,
          -- },
          ['cord.plugins.persistent_timer'] = {
            scope = 'workspace',
            mode = 'all',
            save_on = { 'exit', 'focus_change', 'periodic' },
            save_interval = 30,
          },
        },

        advanced = {
          plugin = {
            autocmds = true,
            cursor_update = 'on_hold',
            match_in_mappings = true,
          },
          server = {
            update = 'fetch',
            timeout = 300000,
          },
          discord = {
            reconnect = { enabled = true, interval = 5000, initial = true },
          },
          workspace = {
            limit_to_cwd = false,
          },
        },
      }
    end,
  },
}
