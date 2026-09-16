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

vim.api.nvim_create_user_command('PackUpdate', function(opts)
  if #opts.fargs == 0 then
    vim.pack.update()
  else
    vim.pack.update(opts.fargs)
  end
end, {
  nargs = '*',
  complete = function()
    return vim
      .iter(vim.pack.get())
      :map(function(x)
        return x.spec.name
      end)
      :totable()
  end,
})

return M
