return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  dependencies = {
    -- Thank You Ilya for the config
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      config = function()
        local textobjects = require 'nvim-treesitter-textobjects'
        local map = vim.keymap.set

        textobjects.setup {
          select = {
            lookahead = true,
            include_surrounding_whitespace = false,
          },
          move = {
            set_jumps = true,
          },
        }

        vim.g.no_plugin_maps = true

        local function setup_selects()
          local ts_select = require 'nvim-treesitter-textobjects.select'
          map({ 'o', 'x' }, '=r', function()
            ts_select.select_textobject('@assignment.rhs', 'textobjects')
          end)

          map({ 'o', 'x' }, 'aa', function()
            ts_select.select_textobject('@parameter.outer', 'textobjects')
          end)

          map({ 'o', 'x' }, 'ia', function()
            ts_select.select_textobject('@parameter.inner', 'textobjects')
          end)

          map({ 'o', 'x' }, 'ai', function()
            ts_select.select_textobject('@conditional.outer', 'textobjects')
          end)

          map({ 'o', 'x' }, 'ii', function()
            ts_select.select_textobject('@conditional.inner', 'textobjects')
          end)

          map({ 'o', 'x' }, 'af', function()
            ts_select.select_textobject('@function.outer', 'textobjects')
          end)
          map({ 'o', 'x' }, 'if', function()
            ts_select.select_textobject('@function.inner', 'textobjects')
          end)

          map({ 'o', 'x' }, 'at', function()
            ts_select.select_textobject('@class.outer', 'textobjects')
          end)

          map({ 'o', 'x' }, 'it', function()
            ts_select.select_textobject('@class.inner', 'textobjects')
          end)
        end

        local function setup_moves()
          local ts_moves = require 'nvim-treesitter-textobjects.move'
          map({ 'n', 'o' }, ']f', function()
            ts_moves.goto_next_start('@function.outer', 'textobjects')
          end)
          map({ 'n', 'o' }, ']F', function()
            ts_moves.goto_next_end('@function.outer', 'textobjects')
          end)

          map({ 'n', 'o' }, '[f', function()
            ts_moves.goto_previous_start('@function.outer', 'textobjects')
          end)
          map({ 'n', 'o' }, '[F', function()
            ts_moves.goto_previous_end('@function.outer', 'textobjects')
          end)
        end

        local function setup_swaps()
          local ts_swaps = require 'nvim-treesitter-textobjects.swap'
          map('n', '<leader>man', function()
            ts_swaps.swap_next '@parameter.inner'
          end)

          map('n', '<leader>map', function()
            ts_swaps.swap_previous '@parameter.inner'
          end)

          map('n', '<leader>mfn', function()
            ts_swaps.swap_next '@function.inner'
          end)
          map('n', '<leader>mfp', function()
            ts_swaps.swap_previous '@function.inner'
          end)
        end

        local ts_group = vim.api.nvim_create_augroup('ilyasyoy-treesitter', {})
        vim.api.nvim_create_autocmd('FileType', {
          pattern = {
            'go',
            'gomod',
            'gosum',
            'make',
            'java',
            'lua',
            'markdown',
            'proto',
            'python',
            'query',
            'sql',
            'typescript',
            'vim',
          },
          callback = function()
            vim.treesitter.start()

            setup_selects()
            setup_moves()
            setup_swaps()

            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
          end,
          group = ts_group,
        })
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter-context',
      config = function()
        local ts_context = require 'treesitter-context'
        ts_context.setup {
          enable = true,
          max_lines = 1,
          line_numbers = true,
        }
      end,
    },
  },
  config = function()
    local treesitter = require 'nvim-treesitter'
    treesitter.install {
      'bash',
      'go',
      'gomod',
      'gosum',
      'lua',
      'luadoc',
      'python',
      'tsx',
      'typescript',
      'css',
      'html',
      'http',
      'markdown',
      'markdown_inline',
      'yaml',
      'csv',
      'json',
      'json5',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
    }

    vim.treesitter.language.register('javascript', 'tsx')
    vim.treesitter.language.register('typescript.tsc', 'tsx')
  end,
}
