local snacks = require 'snacks'

snacks.setup {
  scroll = {
    enabled = false,
  },
  lazygit = {
    theme = {
      selectedLineBgColor = { bg = 'SnacksLazygitSelected' },
      defaultFgColor = { fg = 'Normal' },
      activeBorderColor = { fg = 'MatchParen', bold = true },
      searchingActiveBorderColor = { fg = 'MatchParen', bold = true },
    },
  },
  picker = {
    enabled = true,
    ui_select = true,
    hidden = true,
    ignored = true,
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
    exclude = {
      '/node_modules/*',
      '/dist/*',
      '/.git/*',
      '/.DS_Store/*',
      '/coverage/*',
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
    convert = {
      notify = true,
      mermaid = function()
        local theme = vim.o.background == 'light' and 'neutral' or 'dark'
        return { '-i', '{src}', '-o', '{file}', '-b', 'transparent', '-t', theme, '-s', '{scale}' }
      end,
      magick = {
        default = { '{src}[0]', '-scale', '1920x1080>' },
        vector = { '-density', 192, '{src}[0]' },
        math = { '-density', 192, '{src}[0]', '-trim' },
        pdf = { '-density', 192, '{src}[0]', '-background', 'white', '-alpha', 'remove', '-trim' },
      },
    },
    math = {
      enabled = true,
    },
  },
}

vim.keymap.set('n', '<leader>gl', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })
vim.keymap.set('n', '<leader>rN', function()
  Snacks.rename.rename_file()
end, { desc = 'Rename File' })
vim.keymap.set('n', '<leader>fp', function()
  Snacks.picker.projects()
end, { desc = 'Find Projects' })
vim.keymap.set('n', '<leader>ff', function()
  Snacks.picker.files()
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fd', function()
  Snacks.picker.grep()
end, { desc = 'Find by Grep' })
vim.keymap.set('n', '<leader>fr', function()
  Snacks.picker.recent()
end, { desc = 'Find Recent' })
vim.keymap.set('n', '<leader>fc', function()
  Snacks.picker.git_log()
end, { desc = 'Find Git Commits' })
vim.keymap.set('n', '<leader>fb', function()
  Snacks.picker.git_branches()
end, { desc = 'Find Git Branches' })
vim.keymap.set('n', '<leader>fs', function()
  Snacks.picker.git_status()
end, { desc = 'Find Git Status' })
vim.keymap.set('n', '<leader>ft', function()
  Snacks.picker.git_stash()
end, { desc = 'Find Git Stash' })
