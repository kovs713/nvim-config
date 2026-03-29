local M = {}

function M.setup()
  vim.cmd.packadd 'nvim-dap-ui'
  vim.cmd.packadd 'nvim-nio'
  vim.cmd.packadd 'mason.nvim'
  vim.cmd.packadd 'mason-nvim-dap.nvim'
  vim.cmd.packadd 'nvim-dap-go'
  vim.cmd.packadd 'nvim-dap'

  local dap = require 'dap'
  local dapui = require 'dapui'
  vim.keymap.set('n', '<leader>ds', function()
    dap.continue()
  end, { desc = '[D]ebug: [S]tart/Continue' })
  vim.keymap.set('n', '<leader>do', function()
    dap.step_into()
  end, { desc = '[D]ebug: Step [o] (forward)' })
  vim.keymap.set('n', '<leader>doo', function()
    dap.step_over()
  end, { desc = '[D]ebug: Step [ii] (double forward)' })
  vim.keymap.set('n', '<leader>di', function()
    dap.step_out()
  end, { desc = '[D]ebug: Step [i] (backward)' })
  vim.keymap.set('n', '<leader>dbx', function()
    dap.toggle_breakpoint()
  end, { desc = '[D]ebug: [B]reakpoint Toggle [x]' })
  vim.keymap.set('n', '<leader>dbs', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end, { desc = '[D]ebug: [B]reakpoint [S]et' })
  vim.keymap.set('n', '<leader>du', function()
    dapui.toggle()
  end, { desc = '[D]ebug: See last session result. [U]i' })

  require('mason-nvim-dap').setup {
    automatic_installation = true,

    handlers = {},

    ensure_installed = {},
  }

  dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
      icons = {
        pause = '⏸',
        play = '▶',
        step_into = '⏎',
        step_over = '⏭',
        step_out = '⏮',
        step_back = 'b',
        run_last = '▶▶',
        terminate = '⏹',
        disconnect = '⏏',
      },
    },
  }

  dap.listeners.after.event_initialized['dapui_config'] = dapui.open
  dap.listeners.before.event_terminated['dapui_config'] = dapui.close
  dap.listeners.before.event_exited['dapui_config'] = dapui.close
end

return M
