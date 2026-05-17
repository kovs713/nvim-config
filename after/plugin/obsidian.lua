local obsidian = require 'obsidian'

obsidian.setup {
  legacy_commands = false,
  workspaces = {
    {
      name = 'main',
      path = '~/obsidian-vault/',
    },
  },

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
    blank = true,
    min_chars = 2,
  },

  picker = {
    name = 'snacks',
    note_mappings = {
      new = '<C-n>',
      insert_link = '<C-p>',
    },
  },
}

vim.keymap.set('n', '<leader>od', '<cmd>Obsidian dailies<cr>', { buffer = bufnr, desc = '[O]bsidian [D]ailies' })
vim.keymap.set('n', '<leader>ony', '<cmd>Obsidian yesterday<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [Y]esterday' })
vim.keymap.set('n', '<leader>ont', '<cmd>Obsidian today<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [T]oday' })
vim.keymap.set('n', '<leader>onm', '<cmd>Obsidian tomorrow<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew to[M]orrow' })
vim.keymap.set('n', '<leader>onn', '<cmd>Obsidian new<cr>', { buffer = bufnr, desc = '[O]bsidian [N]ew [N]ote' })
vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<cr>', { buffer = bufnr, desc = '[O]bsidian [S]earch' })

vim.keymap.set('n', 'gf', function()
  return obsidian.util.gf_passthrough()
end, { buffer = bufnr, desc = '[G]oto markdown [F]ile', noremap = false, expr = true })

vim.keymap.set('n', ']o', function()
  require('obsidian.api').nav_link 'next'
end, { buffer = bufnr, desc = 'Go to next Obsidian link' })

vim.keymap.set('n', '[o', function()
  require('obsidian.api').nav_link 'prev'
end, { buffer = bufnr, desc = 'Go to previous Obsidian link' })
