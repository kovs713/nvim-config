local trouble = require 'trouble'

trouble.setup {}

local function next()
  trouble.next { skip_groups = true, jump = true }
end

local function previous()
  trouble.previous { skip_groups = true, jump = true }
end

vim.keymap.set('n', '[t', next, { desc = 'Trouble next item' })
vim.keymap.set('n', ']t', previous, { desc = 'Trouble previous item' })
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics toggle' })

