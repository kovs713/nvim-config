return {
  'thePrimeagen/harpoon',
  enabled = true,
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    local map = vim.keymap.set

    harpoon:setup {
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    }

    --Harpoon Nav Interface
    map('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]dd file' })
    map('n', '<leader>E', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon m[E]nu' })

    --Harpoon marked files
    map('n', '<leader>hh', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon select 1' })
    map('n', '<leader>jj', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon select 2' })
    map('n', '<leader>kk', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon select 3' })
    map('n', '<leader>ll', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon select 4' })
    map('n', '<leader>;;', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon select 5' })

    -- Toggle previous & next buffers stored within Harpoon list
    map('n', '<M-i>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon goto prev' })

    map('n', '<M-o>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon goto next' })
  end,
}
