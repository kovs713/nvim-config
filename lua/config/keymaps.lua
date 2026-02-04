local map = vim.keymap.set
local del_map = vim.keymap.del

local function organize_imports()
  vim.lsp.buf.code_action {
    context = { only = { 'source.organizeImports' } },
    apply = true,
  }
end

map('n', '<leader>gi', organize_imports, { desc = 'Fix Go Imports' })

map('n', '<leader>s', '<CMD>wall<CR><ESC>', { desc = 'Save all buffers' })
-- map('n', '<C-a>', 'ggVG', { desc = 'Select all' })
pcall(del_map, 'n', 'C-i')
map('n', '<C-i>', '<C-o>', { desc = 'Switch to previous buffer' })
pcall(del_map, 'n', 'C-o')
map('n', '<C-o>', '<C-i>', { desc = 'Switch to next buffer' })

map('n', '<leader>gn', '<CMD>!go run .<CR>', { desc = '[G]o Ru[N] current project' })
map('n', '<leader>ge', function()
  local lines = {
    'if err != nil {',
    '    return err',
    '}',
  }
  vim.api.nvim_put(lines, 'l', true, true)
  vim.lsp.buf.format()
end, { desc = '[G]o [E]rror handle pattern' })

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

-- LazyVim shit keymaps
-- local keymaps_to_del = {
--   { 'n', '[b' },
--   { 'n', ']b' },
--   { 'n', '<leader>bb' },
--   { 'n', '<leader>`' },
--   { 'n', '<leader>bd' },
--   { 'n', '<leader>bo' },
--   { 'n', '<leader>bD' },
--   { 'n', '<leader>e' },
--   { 'n', '<leader>sa' },
--   { 'n', '<leader>sb' },
--   { 'n', '<leader>sc' },
--   { 'n', '<leader>sC' },
--   { 'n', '<leader>sd' },
--   { 'n', '<leader>sD' },
--   { 'n', '<leader>sg' },
--   { 'n', '<leader>sG' },
--   { 'n', '<leader>sh' },
--   { 'n', '<leader>sH' },
--   { 'n', '<leader>sj' },
--   { 'n', '<leader>sk' },
--   { 'n', '<leader>sl' },
--   { 'n', '<leader>sm' },
--   { 'n', '<leader>sM' },
--   { 'n', '<leader>ss' },
--   { 'n', '<leader>sS' },
--   { 'n', '<leader>st' },
--   { 'n', '<leader>sT' },
--   { 'n', '<leader>sw' },
--   { 'n', '<leader>sW' },
--   { 'n', '<leader>s"' },
--   { 'n', '<leader>sq' },
--   { 'n', '<leader>sR' },
--   { 'n', '<leader>s/' },
--   { 'n', '<leader>K' },
--   { 'n', '<leader>S' },
--   { 'n', '<leader>be' },
--   { 'n', '<leader>cl' },
--   { 'n', '<leader>cd' },
--   { 'n', '<leader>cf' },
--   { 'n', '<leader>cF' },
--   { 'n', '<leader>cs' },
--   { 'n', '<leader>fb' },
--   { 'n', '<leader>fc' },
--   { 'n', '<leader>fF' },
--   { 'n', '<leader>fg' },
--   { 'n', '<leader>fr' },
--   { 'n', '<leader>fR' },
--   { 'n', '<leader>fn' },
--   { 'n', '<leader>fe' },
--   { 'n', '<leader>fE' },
--   { 'n', '<leader>fT' },
--   { 'n', '<leader>gg' },
--   { 'n', '<leader>gY' },
--   { 'n', '<leader>gL' },
--   { 'n', '<leader><space>' },
--   { 'n', '<leader>.' },
--   { 'n', '<leader>/' },
--   { 'n', '<leader>:' },
--   { 'n', '<leader>,' },
--   { 'n', '<leader>?' },
-- }
--
-- for _, keymap in ipairs(keymaps_to_del) do
--   pcall(vim.keymap.del, keymap[1], keymap[2])
-- end
