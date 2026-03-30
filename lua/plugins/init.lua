local function collect_modules(dir, prefix, out)
  for name, type in vim.fs.dir(dir) do
    if type == 'directory' then
      collect_modules(dir .. '/' .. name, prefix .. '.' .. name, out)
    elseif type == 'file' and name:sub(-4) == '.lua' and name ~= 'init.lua' then
      out[#out + 1] = prefix .. '.' .. name:sub(1, -5)
    end
  end
  return out
end

local modules = collect_modules(vim.fn.stdpath 'config' .. '/lua/plugins', 'plugins', {})
table.sort(modules)

for _, module in ipairs(modules) do
  local ok, mod = pcall(require, module)
  if ok and type(mod.setup) == 'function' then
    local ok_setup, err = pcall(mod.setup)
    if not ok_setup then
      vim.notify('setup failed ' .. module .. ': ' .. err, vim.log.levels.ERROR)
    end
  else
    local err = ok and 'setup missing' or mod
    vim.notify('module load failed ' .. module .. ': ' .. err, vim.log.levels.ERROR)
  end
end
