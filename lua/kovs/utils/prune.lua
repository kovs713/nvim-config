local M = {}

function M.prune()
  local orphans = vim
    .iter(vim.pack.get())
    :filter(function(x)
      return not x.active
    end)
    :map(function(x)
      return x.spec.name
    end)
    :totable()

  if #orphans == 0 then
    vim.notify('PackPrune: nothing to remove', vim.log.levels.INFO)
    return
  end

  local choice = vim.fn.confirm('Remove ' .. #orphans .. ' plugin(s)?\n' .. table.concat(orphans, '\n'), '&Yes\n&No', 2)
  if choice == 1 then
    vim.pack.del(orphans)
  end
end

vim.api.nvim_create_user_command('PackPrune', M.prune, {})

return M
