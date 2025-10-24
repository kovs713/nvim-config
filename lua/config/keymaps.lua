-- My keymaps
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

vim.keymap.set('n', '<esc>', '<cmd>noh<CR>', { silent = true, desc = 'Clear search' })

-- LazyVim shit keymaps
local keymaps_to_del = {
  { 'n', '[b' },
  { 'n', ']b' },
  { 'n', '<leader>bb' },
  { 'n', '<leader>`' },
  { 'n', '<leader>bd' },
  { 'n', '<leader>bo' },
  { 'n', '<leader>bD' },
  { 'n', '<leader>e' },
  { 'n', '<leader>sa' },
  { 'n', '<leader>sb' },
  { 'n', '<leader>sc' },
  { 'n', '<leader>sC' },
  { 'n', '<leader>sd' },
  { 'n', '<leader>sD' },
  { 'n', '<leader>sg' },
  { 'n', '<leader>sG' },
  { 'n', '<leader>sh' },
  { 'n', '<leader>sH' },
  { 'n', '<leader>sj' },
  { 'n', '<leader>sk' },
  { 'n', '<leader>sl' },
  { 'n', '<leader>sm' },
  { 'n', '<leader>sM' },
  { 'n', '<leader>ss' },
  { 'n', '<leader>sS' },
  { 'n', '<leader>st' },
  { 'n', '<leader>sT' },
  { 'n', '<leader>sw' },
  { 'n', '<leader>sW' },
  { 'n', '<leader>s"' },
  { 'n', '<leader>sq' },
  { 'n', '<leader>sR' },
  { 'n', '<leader>s/' },
  { 'n', '<leader>K' },
  { 'n', '<leader>S' },
  { 'n', '<leader>be' },
  { 'n', '<leader>cl' },
  { 'n', '<leader>cd' },
  { 'n', '<leader>cf' },
  { 'n', '<leader>cF' },
  { 'n', '<leader>cs' },
  { 'n', '<leader>fb' },
  { 'n', '<leader>fc' },
  { 'n', '<leader>fF' },
  { 'n', '<leader>fg' },
  { 'n', '<leader>fr' },
  { 'n', '<leader>fR' },
  { 'n', '<leader>fn' },
  { 'n', '<leader>fe' },
  { 'n', '<leader>fE' },
  { 'n', '<leader>fT' },
  { 'n', '<leader>gg' },
  { 'n', '<leader>gY' },
  { 'n', '<leader>gL' },
  { 'n', '<leader><space>' },
  { 'n', '<leader>.' },
  { 'n', '<leader>/' },
  { 'n', '<leader>:' },
  { 'n', '<leader>,' },
  { 'n', '<leader>?' },
  { 'n', '<Tab>' },
}

for _, keymap in ipairs(keymaps_to_del) do
  pcall(vim.keymap.del, keymap[1], keymap[2])
end
