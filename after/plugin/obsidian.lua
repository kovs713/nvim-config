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
