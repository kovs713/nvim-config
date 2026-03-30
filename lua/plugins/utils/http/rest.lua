local M = {}

function M.setup()
  vim.pack.add {'https://github.com/rest-nvim/rest.nvim'}
  pcall(vim.cmd.packadd, 'nvim-treesitter')

  local map = vim.keymap.set

  local ok = pcall(vim.cmd.packadd, 'rest.nvim')
  if not ok then
    return
  end
  local ok, rest = pcall(require, 'rest-nvim')
  if not ok then
    return
  end

  local ok_setup = pcall(rest.setup, {})
  if not ok_setup then
    return
  end

  map('n', '<leader>hr', '<cmd>Rest run<cr>', { desc = '[H]ttp [R]un under cursor' })
  map('n', '<leader>hl', '<cmd>Rest last<cr>', { desc = '[H]ttp run [L]ast' })
  map('n', '<leader>hd', '<cmd>Rest run document<cr>', { desc = '[H]ttp run [D]ocument' })
end

return M
