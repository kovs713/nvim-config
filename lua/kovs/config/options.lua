--- diagnostic disable: 113
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
}

vim.cmd [[
  set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=0
]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

vim.g.deprecation_warnings = false

vim.cmd 'let g:netrw_liststyle = 3'

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = 'a'
opt.showmode = true

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'

opt.updatetime = 250

opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = false
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'

opt.cursorline = true

opt.scrolloff = 10
opt.laststatus = 2
opt.cmdheight = 1

opt.autowrite = true
opt.conceallevel = 2
opt.confirm = true
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.expandtab = true
opt.jumpoptions = 'view'
opt.linebreak = true
opt.ruler = false
opt.shiftround = true
opt.shiftwidth = 2
opt.timeoutlen = vim.g.vscode and 1000 or 300
