local M = {}

function M.has_vue_deps(pkg)
  if type(pkg) ~= 'table' then
    return false
  end
  for _, deps in ipairs { pkg.dependencies, pkg.devDependencies, pkg.peerDependencies, pkg.optionalDependencies } do
    if type(deps) == 'table' then
      for name in pairs(deps) do
        if name == 'vue' or name == 'nuxt' or (type(name) == 'string' and name:match '^@vue/') then
          return true
        end
      end
    end
  end
  return false
end

function M.nearest_package_root(bufnr)
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

function M.is_vue_project(root)
  if type(root) ~= 'string' or root == '' then
    return false
  end

  local ok, lines = pcall(vim.fn.readfile, root .. '/package.json')
  if not ok then
    return false
  end

  local ok2, pkg = pcall(vim.json.decode, table.concat(lines, '\n'))
  if not ok2 then
    return false
  end

  return M.has_vue_deps(pkg)
end

return M
