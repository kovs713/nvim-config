--- diagnostic disable: 113
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

-- [[ Setting options ]]
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.termguicolors = true

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- [[ Basic Autocommands ]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Configure basic keymaps ]]
vim.keymap.set('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>wall<CR>', { desc = 'Save all buffers' })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down in Visual mode' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up in Visual mode' })
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})
vim.keymap.set('v', '<', '<g', {})
vim.keymap.set('v', '>', '>g', {})
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without saving' })

vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^', { desc = 'Go to start of line' })
vim.keymap.set({ 'n', 'x', 'o' }, 'L', 'g_', { desc = 'Go to end of line' })

vim.keymap.set('n', '<C-i>', '<C-o>', { desc = 'Replace goto next' })
vim.keymap.set('n', '<C-o>', '<C-i>', { desc = 'Replace goto prev' })
vim.keymap.set('n', '<esc>', '<cmd>noh<CR>', { silent = true, desc = 'Clear search' })

vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Moving between windows' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Moving between windows' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Moving between windows' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Moving between windows' })

vim.keymap.set('n', '<M-=>', '<C-w>+', { desc = 'Resize window +' })
vim.keymap.set('n', '<M-->', '<C-w>-', { desc = 'Resize window -' })
vim.keymap.set('n', '<M-,>', '<C-w>>', { desc = 'Resize window >' })
vim.keymap.set('n', '<M-.>', '<C-w><', { desc = 'Resize window <' })

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  require 'plugins.autopairs',
  require 'plugins.blink-cmp',
  require 'plugins.bullets',
  require 'plugins.colorizer',
  require 'plugins.comment',
  require 'plugins.conform',
  -- require 'plugins.debug',
  require 'plugins.dressing',
  require 'plugins.emmet',
  require 'plugins.flash',
  require 'plugins.fzf',
  require 'plugins.gitsigns',
  require 'plugins.gruvbox',
  require 'plugins.harpoon',
  require 'plugins.img-clip',
  require 'plugins.incline',
  require 'plugins.lazydev',
  require 'plugins.lint',
  require 'plugins.lsp-config',
  require 'plugins.lspsaga',
  require 'plugins.mason',
  require 'plugins.mini-starter',
  require 'plugins.mini-statusline',
  require 'plugins.mini',
  require 'plugins.neo-tree',
  require 'plugins.noice',
  require 'plugins.nvim-treesitter',
  require 'plugins.obsidian',
  require 'plugins.render-markdown',
  require 'plugins.sleuth',
  require 'plugins.snacks',
  require 'plugins.tailwind-tools',
  require 'plugins.todo-comments',
  require 'plugins.trouble',
  require 'plugins.ts-autotag',
  require 'plugins.typesctipt-tools',
  require 'plugins.wakatime',
  require 'plugins.which-key',
  require 'plugins.winshift',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
