local gitsigns = require 'gitsigns'

gitsigns.setup {
  on_attach = function(bufnr)
    vim.keymap.set('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal { '[h', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git change' })

    vim.keymap.set('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal { ']h', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git change' })

    vim.keymap.set('v', '<leader>gs', function()
      gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = 'git stage hunk' })

    vim.keymap.set('v', '<leader>gr', function()
      gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, { desc = 'git reset hunk' })

    vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git stage hunk' })

    vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git reset hunk' })

    vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git stage buffer' })

    vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'git undo stage hunk' })

    vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git reset buffer' })

    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git preview hunk' })

    vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = 'git blame line' })

    vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'git diff against index' })

    vim.keymap.set('n', '<leader>gD', function()
      gitsigns.diffthis '@'
    end, { desc = 'git diff against last commit' })

    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame line' })

    vim.keymap.set('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = 'Toggle git show deleted' })
  end,
}
