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
      formats = {
        'png',
        'jpg',
        'jpeg',
        'gif',
        'bmp',
        'webp',
        'tiff',
        'heic',
        'avif',
        'mp4',
        'mov',
        'avi',
        'mkv',
        'webm',
        'pdf',
      },
      force = false,
      doc = {
        enabled = true,
        inline = false,
        float = true,
        max_width = 50,
        max_height = 25,
        conceal = false,
      },
      img_dirs = { 'img', 'images', 'assets', 'static', 'public', 'media', 'attachments' },
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = 'no',
        foldcolumn = '0',
        list = false,
        spell = false,
        statuscolumn = '',
      },
      cache = vim.fn.stdpath 'cache' .. '/snacks/image',
      debug = {
        request = false,
        convert = false,
        placement = false,
      },
      env = {},
      ---@class snacks.image.convert.Config
      convert = {
        notify = true,
        ---@type snacks.image.args
        mermaid = function()
          local theme = vim.o.background == 'light' and 'neutral' or 'dark'
          return { '-i', '{src}', '-o', '{file}', '-b', 'transparent', '-t', theme, '-s', '{scale}' }
        end,
        ---@type table<string,snacks.image.args>
        magick = {
          default = { '{src}[0]', '-scale', '1920x1080>' },
          vector = { '-density', 192, '{src}[0]' },
          math = { '-density', 192, '{src}[0]', '-trim' },
          pdf = { '-density', 192, '{src}[0]', '-background', 'white', '-alpha', 'remove', '-trim' },
        },
      },
      math = {
        enabled = true,
        typst = {
          tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 12pt, fill: rgb("${color}"))
        ${header}
        ${content}]],
        },
        latex = {
          font_size = 'Large',
          packages = { 'amsmath', 'amssymb', 'amsfonts', 'amscd', 'mathtools' },
          tpl = [[
        \documentclass[preview,border=2pt,varwidth,12pt]{standalone}
        \usepackage{${packages}}
        \begin{document}
        ${header}
        { \${font_size} \selectfont
          \color[HTML]{${color}}
        ${content}}
        \end{document}]],
        },
      },
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
