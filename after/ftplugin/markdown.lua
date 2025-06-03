local set = vim.opt_local

set.textwidth = 80 -- Wrap text at 80 characters
set.spell = true -- Enable spell checking
set.linebreak = true

-- added extra highlights for markdown files to render highlights properly

local color1_bg = '#fb4934'
local color2_bg = '#8ec07c'
local color3_bg = '#b8bb26'
local color4_bg = '#fabd2f'
local color5_bg = '#fe8019'
local color6_bg = '#83a598'
local color_fg = '#a89984'

vim.cmd(string.format([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color1_bg))
vim.cmd(string.format([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color2_bg))
vim.cmd(string.format([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color3_bg))
vim.cmd(string.format([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color4_bg))
vim.cmd(string.format([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color5_bg))
vim.cmd(string.format([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=%s guibg=%s]], color_fg, color6_bg))
