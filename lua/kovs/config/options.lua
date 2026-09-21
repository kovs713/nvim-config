require('vim._core.ui2').enable {}

local has_display = vim.env.DISPLAY ~= nil or vim.env.WAYLAND_DISPLAY ~= nil
local is_tty = vim.env.TERM == 'linux'
local is_tmux = vim.env.TMUX ~= nil
local is_raw_terminal = not has_display and (is_tty or is_tmux)

if is_raw_terminal then
  vim.o.termguicolors = false
  vim.g.icons_enabled = false
  vim.g.have_nerd_font = false
else
  vim.o.termguicolors = true
  vim.g.icons_enabled = true
  vim.g.have_nerd_font = true
end

vim.o.cmdheight = 0
vim.diagnostic.config {
  underline = true,
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  signs = false,
}

vim.cmd [[
  set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=0
]]

vim.opt.langmap = 'ёй,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],'
  .. "фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',"
  .. 'яz,чx,сc,мv,иb,тn,ьm,ё`,'
  .. 'ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},'
  .. 'ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Э",'
  .. 'ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Ё~'
vim.opt.langremap = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
