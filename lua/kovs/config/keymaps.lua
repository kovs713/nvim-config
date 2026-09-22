local function copy_to_clipboard(value, label)
  if value == '' then
    vim.notify(label .. ' not found', vim.log.levels.WARN)
    return
  end

  vim.fn.setreg('+', value)
  vim.fn.setreg('"', value)
  vim.notify(label .. ' copied: ' .. value)
end

local function current_project_root()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return vim.fn.getcwd()
  end

  return vim.fs.root(path, { '.git' }) or vim.fn.getcwd()
end

local function copy_filename()
  copy_to_clipboard(vim.fn.expand '%:t', 'Filename')
end

local function copy_project_relative_path()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    copy_to_clipboard('', 'Project path')
    return
  end

  local root = current_project_root()
  local relative = vim.fs.relpath(root, path) or vim.fn.fnamemodify(path, ':.')
  copy_to_clipboard(relative, 'Project path')
end

-- vim.keymap.set('n', '<leader>fu', require('undotree').open, { desc = '[F]ind [U]ndoTree' })

vim.keymap.set('n', '<leader>nr', '<CMD>restart<CR>', { desc = '[N]eovim [R]estart' })
vim.keymap.set('n', '<leader>yf', copy_filename, { desc = '[Y]ank [F]ilename' })
vim.keymap.set('n', '<leader>yp', copy_project_relative_path, { desc = '[Y]ank project [P]ath' })

vim.keymap.set({ 'n', 'v', 'i', 'c' }, '<M-Space>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>s', '<CMD>write<CR><ESC>', { desc = 'Save buffer' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})
vim.keymap.set('v', '<', '<g', {})
vim.keymap.set('v', '>', '>g', {})
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without saving' })

vim.keymap.set('n', '<ESC>', '<CMD>noh<CR>', { silent = true, desc = 'Clear search' })

vim.keymap.set('n', ']3', function()
  vim.diagnostic.jump { count = 1, float = false }
end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = false }
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

vim.keymap.set('n', ']!', function()
  cycle_quickfix(1)
end, { desc = 'Quickfix next' })
vim.keymap.set('n', '[q', function()
  cycle_quickfix(-1)
end, { desc = 'Quickfix prev' })
vim.keymap.set('n', ']9', function()
  cycle_loclist(1)
end, { desc = 'Location list next' })
vim.keymap.set('n', '[l', function()
  cycle_loclist(-1)
end, { desc = 'Location list prev' })

vim.keymap.set('n', ']-', function()
  vim.cmd.normal { ']c', bang = true }
end, { desc = 'Diff next change' })
vim.keymap.set('n', '[c', function()
  vim.cmd.normal { '[c', bang = true }
end, { desc = 'Diff prev change' })
