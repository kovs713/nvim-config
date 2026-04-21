local map = vim.keymap.set
local del_map = vim.keymap.de

map('i', '<A-c>', '<C-^>', { noremap = true, desc = 'Switch language layout RU/EN' })
map('n', '<leader>nr', '<CMD>restart<CR>', { desc = '[N]eovim [R]estart' })

map({ 'n', 'v', 'i', 'c' }, '<M-Space>', '<Nop>', { noremap = true, silent = true })

map('n', '<leader>s', '<CMD>wall<CR><ESC>', { desc = 'Save all buffers' })

pcall(del_map, 'n', 'C-i')
map('n', '<C-i>', '<C-o>', { desc = 'Switch to previous buffer' })
pcall(del_map, 'n', 'C-o')
map('n', '<C-o>', '<C-i>', { desc = 'Switch to next buffer' })

map('n', '<A-h>', '<C-w>h', { desc = 'Move between windows (left)' })
map('n', '<A-j>', '<C-w>j', { desc = 'Move between windows (down)' })
map('n', '<A-k>', '<C-w>k', { desc = 'Move between windows (up)' })
map('n', '<A-l>', '<C-w>l', { desc = 'Move between windows (right)' })
map('n', '<A-q>', '<C-w>q', { desc = 'Close window' })

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

map('n', '[d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })
map('n', ']d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev diagnostic' })

local function cycle_quickfix(dir)
  local ok, err = pcall(dir == 1 and vim.cmd.cnext or vim.cmd.cprev)
  if not ok and err:match 'E553' then
    if dir == 1 then
      vim.cmd.cfirst()
    else
      vim.cmd.clast()
    end
  end
end

local function cycle_loclist(dir)
  local ok, err = pcall(dir == 1 and vim.cmd.lnext or vim.cmd.lprev)
  if not ok and err:match 'E553' then
    if dir == 1 then
      vim.cmd.lfirst()
    else
      vim.cmd.llast()
    end
  end
end

map('n', '[q', function()
  cycle_quickfix(1)
end, { desc = 'Quickfix next' })
map('n', ']q', function()
  cycle_quickfix(-1)
end, { desc = 'Quickfix prev' })
map('n', '[l', function()
  cycle_loclist(1)
end, { desc = 'Location list next' })
map('n', ']l', function()
  cycle_loclist(-1)
end, { desc = 'Location list prev' })

map('n', '[c', function()
  vim.cmd.normal { ']c', bang = true }
end, { desc = 'Diff next change' })
map('n', ']c', function()
  vim.cmd.normal { '[c', bang = true }
end, { desc = 'Diff prev change' })
