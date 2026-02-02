return {
  'nvim-mini/mini.starter',
  version = '*',
  config = function()
    local starter = require 'mini.starter'

    starter.setup {
      content_hooks = {
        starter.gen_hook.aligning('center', 'center'),
        starter.gen_hook.padding(3, 2),
      },
      items = {
        require('mini.starter').sections.recent_files(4, true),
      },
      header = [[
                               __
  ___      __    ___   __  __ /\_\    ___ ___
/' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\
/\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/ _/
]],
    }
  end,
}
