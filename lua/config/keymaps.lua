local map = vim.keymap.set
local del_map = vim.keymap.de

map('i', '<C-l>', '<C-^>', { noremap = true, desc = 'Switch language layout RU/EN' })

map('n', '<leader>s', '<CMD>wall<CR><ESC>', { desc = 'Save all buffers' })

pcall(del_map, 'n', 'C-i')
map('n', '<C-i>', '<C-o>', { desc = 'Switch to previous buffer' })
pcall(del_map, 'n', 'C-o')
map('n', '<C-o>', '<C-i>', { desc = 'Switch to next buffer' })

map('n', '<A-h>', '<C-w>h', { desc = 'Moving to the window left [h]' })
map('n', '<A-j>', '<C-w>j', { desc = 'Moving to the window down [j]' })
map('n', '<A-k>', '<C-w>k', { desc = 'Moving to the window up [k]' })
map('n', '<A-l>', '<C-w>l', { desc = 'Moving to the window right [l]' })
map('n', '<A-=>', '<C-w>+', { desc = 'Resize window + (increace horizontal)' })
map('n', '<A-->', '<C-w>-', { desc = 'Resize window - (decreace horizontal)' })
map('n', '<A-.>', '<C-w><', { desc = 'Resize window < (increace vertical)' })
map('n', '<M-,>', '<C-w>>', { desc = 'Resize window > (decreace vertical)' })

map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-u>', '<C-u>zz', {})
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down in Visual mode' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up in Visual mode' })

map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

map('n', '*', '*zz', {})
map('n', '#', '#zz', {})
map('n', 'g*', 'g*zz', {})
map('n', 'g#', 'g#zz', {})
map('v', '<', '<g', {})
map('v', '>', '>g', {})
map('v', 'p', '"_dP', { desc = 'Paste without saving' })

map({ 'n', 'x', 'o' }, 'H', '^', { desc = 'Go to start of line' })
map({ 'n', 'x', 'o' }, 'L', 'g_', { desc = 'Go to end of line' })

map('n', '<ESC>', '<CMD>noh<CR>', { silent = true, desc = 'Clear search' })

map('n', '<A-j>', "<CMD>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<CMD>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<ESC><CMD>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<ESC><CMD>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })
