local ts_pack = require 'ts-pack'
local library = require 'ts-pack.library'
local ts_select = require 'nvim-treesitter-textobjects.select'
local ts_moves = require 'nvim-treesitter-textobjects.move'
local ts_textobjects = require 'nvim-treesitter-textobjects'

ts_pack.setup {
  install_jobs = 4,
}

pcall(function()
  ts_pack.add(library.select {
    'lua',
    'markdown',
    'markdown_inline',
    'bash',
    'python',
    'go',
    'gomod',
    'gosum',
    'javascript',
    'typescript',
    'tsx',
    'jsx',
    'vue',
    'svelte',
    'json',
    'json5',
    'yaml',
    'toml',
    'html',
    'css',
    'scss',
    'php',
    'blade',
    'twig',
    'rust',
    'solidity',
    'astro',
    'sql',
    'dockerfile',
    'git_config',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'http',
  })
end)

vim.treesitter.language.register('javascript', 'tsx')
vim.treesitter.language.register('typescript.tsc', 'tsx')

ts_textobjects.setup {
  select = {
    lookahead = true,
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
}

local function setup_selects()
  local buf_opts = { buffer = true }

  vim.keymap.set({ 'o', 'x' }, 'aa', function()
    ts_select.select_textobject('@parameter.outer', 'textobjects')
  end, buf_opts)
  vim.keymap.set({ 'o', 'x' }, 'ia', function()
    ts_select.select_textobject('@parameter.inner', 'textobjects')
  end, buf_opts)

  vim.keymap.set({ 'o', 'x' }, 'af', function()
    ts_select.select_textobject('@function.outer', 'textobjects')
  end, buf_opts)
  vim.keymap.set({ 'o', 'x' }, 'if', function()
    ts_select.select_textobject('@function.inner', 'textobjects')
  end, buf_opts)

  vim.keymap.set({ 'o', 'x' }, 'ac', function()
    ts_select.select_textobject('@class.outer', 'textobjects')
  end, buf_opts)
  vim.keymap.set({ 'o', 'x' }, 'ic', function()
    ts_select.select_textobject('@class.inner', 'textobjects')
  end, buf_opts)
end

local function setup_moves()
  local buf_opts = { buffer = true }

  vim.keymap.set({ 'n', 'o', 'x' }, ']f', function()
    ts_moves.goto_next_start('@function.outer', 'textobjects')
  end, buf_opts)
  vim.keymap.set({ 'n', 'o', 'x' }, '[f', function()
    ts_moves.goto_previous_start('@function.outer', 'textobjects')
  end, buf_opts)
end

local ts_group = vim.api.nvim_create_augroup('kovs-treesitter', {})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'lua',
    'python',
    'go',
    'javascript',
    'typescript',
    'typescriptreact',
    'vim',
  },
  callback = function()
    vim.treesitter.start()
    setup_selects()
    setup_moves()

    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt_local.foldlevel = 99
  end,
  group = ts_group,
})

local ts_context = require 'treesitter-context'
ts_context.setup {
  enable = true,
  max_lines = 1,
}

vim.keymap.set('n', '[c', function()
  ts_context.go_to_context(vim.v.count1)
end, { silent = true })
