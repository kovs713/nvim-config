local M = {}

function M.setup()
  vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.starter' },
  }, { confirm = false })

  local mini_starter = require 'mini.starter'

  mini_starter.setup {
    content_hooks = {
      mini_starter.gen_hook.aligning('center', 'center'),
      mini_starter.gen_hook.padding(3, 2),
    },
    items = {
      mini_starter.sections.recent_files(4, true),
    },
    header = [[
  ___      __    ___   __  __ /\_\    ___ ___
/' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\
/\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/ _/
]],
  }
end

return M
