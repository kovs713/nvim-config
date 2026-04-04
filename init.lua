-- Add luarocks paths to Neovim's package.path
local luarocks_path = vim.fn.expand '~/.luarocks/share/lua/5.1/?.lua;'
    .. vim.fn.expand '~/.luarocks/share/lua/5.1/?/init.lua;'
package.path = luarocks_path .. package.path

require 'config'

require 'plugins'

require 'snippets'
