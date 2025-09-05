return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    event = 'VeryLazy',
    opts = function()
      local data_path = vim.fn.stdpath 'data' .. '/cord/plugins/daily_timer/data.json'

      local state = {
        day = os.date '%F',
        ws = nil,
        start = nil,
        active = true,
        data = {},
      }

      local function read_json(path)
        if vim.fn.filereadable(path) == 0 then
          return nil
        end
        local ok, decoded = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(path), '\n'))
        return ok and decoded or nil
      end

      local function save_json(path, tbl)
        vim.fn.mkdir(vim.fn.fnamemodify(path, ':h'), 'p')
        local ok, encoded = pcall(vim.fn.json_encode, tbl)
        if ok then
          vim.fn.writefile({ encoded }, path)
        end
      end

      state.data = read_json(data_path) or {}

      local function flush(now)
        if not (state.ws and state.active and state.start) then
          return
        end
        local day = os.date('%F', now)
        state.data[day] = state.data[day] or {}
        state.data[day][state.ws] = (state.data[day][state.ws] or 0) + (now - state.start)
        state.start = now
      end

      local function roll_day(now)
        local today = os.date('%F', now)
        if state.day ~= today then
          -- закрываем старый день
          flush(now)
          state.day = today
          state.start = now
        end
      end

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
          pre_activity = function(opts) -- перед сборкой активности можно подменить таймстамп
            local now = os.time()
            roll_day(now)

            -- застрахуемся на первом вызове
            state.ws = state.ws or (opts.workspace or 'global')
            state.start = state.start or now
            state.active = not opts.is_idle

            -- текущая сумма за сегодня + незавершённый активный отрезок
            local acc = ((state.data[state.day] or {})[state.ws] or 0)
            if state.active and state.start then
              acc = acc + (now - state.start)
            end

            -- Discord ждёт стартовую метку: ставим (now - acc)
            opts.timestamp = (now - acc) * 1000 -- миллисекунды
          end,

          workspace_change = function(opts)
            local now = os.time()
            roll_day(now)
            flush(now) -- добьём предыдущий ws
            state.ws = opts.workspace or 'global'
            state.start = now
            state.active = not opts.is_idle
            save_json(data_path, state.data)
          end,

          idle_enter = function(_)
            local now = os.time()
            roll_day(now)
            flush(now) -- закрываем активный отрезок
            state.active = false
            save_json(data_path, state.data)
          end,

          idle_leave = function(_)
            state.start = os.time()
            state.active = true
          end,

          shutdown = function()
            local now = os.time()
            roll_day(now)
            flush(now)
            save_json(data_path, state.data)
          end,
        }),

        plugins = {
          ['cord.plugins.diagnostics'] = {
            scope = 'buffer',
            severity = { min = vim.diagnostic.severity.WARN },
            override = false,
          },
          -- ['cord.plugins.scoped_timestamps'] = {
          --   scope = 'workspace',
          --   pause = true,
          -- },
          -- ['cord.plugins.persistent_timer'] = {
          --   scope = 'workspace',
          --   mode = 'all',
          --   save_on = { 'exit', 'focus_change', 'periodic' },
          --   save_interval = 30,
          -- },
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
