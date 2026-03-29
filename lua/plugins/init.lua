local modules = {
  -- base deps
  'plugins.utils.mini',
  'plugins.syntax.treesitter',

  -- appearance
  'plugins.appearance.theme',
  'plugins.appearance.dressing',
  'plugins.appearance.mini-starter',
  'plugins.appearance.mini-statusline',
  'plugins.appearance.render-markdown',
  'plugins.appearance.screenkey',
  'plugins.appearance.vim-tpipeline',

  -- navigation
  'plugins.navigation.snacks',
  'plugins.navigation.oil',
  'plugins.navigation.which-key',
  'plugins.navigation.flash',
  'plugins.navigation.harpoon',
  'plugins.navigation.trouble',

  -- editing
  'plugins.editing.comment',
  'plugins.editing.nvim-ts-context-commentstring',
  'plugins.editing.nvim-ts-autotag',
  'plugins.editing.gitsigns',
  'plugins.editing.refactoring',
  'plugins.editing.crates',
  'plugins.editing.bullets',

  -- formatting
  'plugins.formatting.vim-sleuth',
  'plugins.formatting.guess-indent',
  'plugins.formatting.conform',
  'plugins.formatting.nvim-lint',

  -- syntax extras
  'plugins.syntax.markdown-plus',
  'plugins.syntax.nvim-highlight-colors',
  'plugins.syntax.tailwind-tools',

  -- lsp
  'plugins.lsp.cmp',
  'plugins.lsp.mason',
  'plugins.lsp.nvim-lspconfig',
  'plugins.lsp.tiny-code-actions',
  'plugins.lsp.rustacenvim',
  'plugins.lsp.nvim-dap',
  'plugins.syntax.typescript-tools',

  -- utils
  'plugins.utils.cord',
  'plugins.utils.img-clip',
  'plugins.utils.obsidian',
  'plugins.utils.wakatime',
  'plugins.utils.http.curl',
  'plugins.utils.http.kulala',
  'plugins.utils.http.rest',
}

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
