local ls = require 'luasnip'
local f = ls.function_node
local loaders = {
  vscode = require 'luasnip.loaders.from_vscode',
  lua = require 'luasnip.loaders.from_lua',
}

loaders.vscode.lazy_load()
loaders.lua.lazy_load {
  paths = { '~/.config/nvim/lua/kovs/snippets' },
}

local M = {}

local date_format = '%Y-%m-%d'
local seconds_in_day = 60 * 60 * 24

function M.current_date()
  return f(function()
    return os.date(date_format)
  end)
end

function M.yesterday_date()
  return f(function()
    return os.date(date_format, os.time() - seconds_in_day)
  end)
end

function M.tomorrow_date()
  return f(function()
    return os.date(date_format, os.time() + seconds_in_day)
  end)
end

return M
