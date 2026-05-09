local harpoon = require 'harpoon'

harpoon:setup {
  global_settings = {
    save_on_toggle = true,
    save_on_change = true,
  },
}

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Harpoon add file' })
vim.keymap.set('n', '<leader>E', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon menu' })

vim.keymap.set('n', '<leader>hh', function()
  harpoon:list():select(1)
end, { desc = 'Harpoon select 1' })
vim.keymap.set('n', '<leader>jj', function()
  harpoon:list():select(2)
end, { desc = 'Harpoon select 2' })
vim.keymap.set('n', '<leader>kk', function()
  harpoon:list():select(3)
end, { desc = 'Harpoon select 3' })
vim.keymap.set('n', '<leader>ll', function()
  harpoon:list():select(4)
end, { desc = 'Harpoon select 4' })
vim.keymap.set('n', '<leader>;', function()
  harpoon:list():select(5)
end, { desc = 'Harpoon select 5' })
