local M = {}

-- -- ashen
-- return {
--   {
--     'ficcdaf/ashen.nvim',
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--       local ashen = require 'ashen'
--       ashen.setup {
--         transparent = true,
--       }
--
--       ashen.load()
--     end,
--   },
-- }

-- -- milkmatcha
-- return {
--   name = 'milkmatcha',
--   dir = vim.fn.stdpath 'config',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme 'milkmatcha'
--   end,
-- }

-- -- flexoki light
-- return {
--   'kepano/flexoki-neovim',
--   name = 'flexoki',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd 'colorscheme flexoki-light'
--   end,
-- }

-- -- everforest light
-- return {
--   'neanias/everforest-nvim',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local everforest = require 'everforest'
-- --
-- --     everforest.setup {
-- --       background = 'light',
-- --       transparent_background_level = 0,
-- --       italics = true,
-- --       disable_italic_comments = false,
-- --       inlay_hints_background = 'dimmed',
-- --       on_highlights = function(hl, palette)
-- --         hl['@string.special.symbol.ruby'] = { link = '@field' }
-- --         hl['DiagnosticUnderlineWarn'] = { undercurl = true, sp = palette.yellow }
-- --       end,
-- --     }
-- -- --
-- -- --     everforest.load()
-- -- --   end,
-- -- -- }

function M.setup()
  vim.pack.add {'https://github.com/rose-pine/neovim'}
  vim.cmd.packadd 'rose-pine'

  vim.cmd 'colorscheme rose-pine-dawn'
end

return M
