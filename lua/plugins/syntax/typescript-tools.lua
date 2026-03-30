local M = {}

function M.setup()
  vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }
  vim.cmd.packadd 'plenary.nvim'
  vim.cmd.packadd 'nvim-lspconfig'
  vim.cmd.packadd 'typescript-tools.nvim'

  local function has_vue_deps(pkg)
    if type(pkg) ~= 'table' then
      return false
    end

    local sections = {
      pkg.dependencies,
      pkg.devDependencies,
      pkg.peerDependencies,
      pkg.optionalDependencies,
    }

    for _, deps in ipairs(sections) do
      if type(deps) == 'table' then
        if deps.vue or deps.nuxt then
          return true
        end
        for dep_name, _ in pairs(deps) do
          if type(dep_name) == 'string' and dep_name:match '^@vue/' then
            return true
          end
        end
      end
    end

    return false
  end

  local function nearest_package_root(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)
    if path == '' then
      return nil
    end

    local package_json = vim.fs.find('package.json', {
      upward = true,
      path = vim.fs.dirname(path),
    })[1]

    if not package_json then
      return nil
    end

    return vim.fs.dirname(package_json)
  end

  local function is_vue_project(bufnr)
    local root = nearest_package_root(bufnr or 0)
    if not root or root == '' then
      return false
    end

    local package_json = root .. '/package.json'
    if vim.fn.filereadable(package_json) == 0 then
      return false
    end

    local ok_read, lines = pcall(vim.fn.readfile, package_json)
    if not ok_read then
      return false
    end

    local ok_decode, pkg = pcall(vim.json.decode, table.concat(lines, '\n'))
    if not ok_decode then
      return false
    end

    return has_vue_deps(pkg)
  end

  local typescript_tools_utils = require 'typescript-tools.utils'
  local typescript_tools = require 'typescript-tools'
  local map = vim.keymap.set

  typescript_tools.setup {
    root_dir = function(bufnr, on_dir)
      if is_vue_project(bufnr) then
        return
      end
      on_dir(typescript_tools_utils.get_root_dir(bufnr))
    end,
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },

    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  }

  map('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS [R]ename [F]ile + Fix Imports' })
  map('n', '<leader>i', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize [I]mports' })
end

return M
