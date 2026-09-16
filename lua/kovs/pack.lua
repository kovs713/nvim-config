local gh = function(x)
  return 'https://github.com/' .. x
end

local M = {
  specs = {
    -- appearance
    { src = gh 'vimpostor/vim-tpipeline' },
    { src = gh 'NStefan002/screenkey.nvim' },
    { src = gh 'MeanderingProgrammer/render-markdown.nvim' },
    { src = gh 'stevearc/dressing.nvim' },
    { src = gh 'nvim-mini/mini.statusline' },
    { src = gh 'nvim-mini/mini.icons' },

    -- editing
    { src = gh 'JoosepAlviste/nvim-ts-context-commentstring' },
    { src = gh 'windwp/nvim-ts-autotag' },
    { src = gh 'lewis6991/gitsigns.nvim' },
    { src = gh 'numToStr/Comment.nvim' },
    { src = gh 'bullets-vim/bullets.vim' },

    -- formatting
    { src = gh 'mfussenegger/nvim-lint' },
    { src = gh 'stevearc/conform.nvim' },
    { src = gh 'tpope/vim-sleuth' },
    { src = gh 'NMAC427/guess-indent.nvim' },

    -- lsp
    { src = gh 'williamboman/mason.nvim' },
    { src = gh 'mason-org/mason-lspconfig.nvim' },
    { src = gh 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { src = gh 'j-hui/fidget.nvim' },
    { src = gh 'nvim-lua/plenary.nvim' },
    { src = gh '/jmbuhr/otter.nvim' },
    { src = gh 'neovim/nvim-lspconfig' },
    { src = gh 'mrcjkb/rustaceanvim' },
    -- { src = gh 'rachartier/tiny-code-action.nvim' },
    { src = gh 'rachartier/tiny-inline-diagnostic.nvim' },

    -- navigation
    { src = gh 'folke/snacks.nvim' },
    { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
    { src = gh 'folke/which-key.nvim' },
    { src = gh 'folke/trouble.nvim' },
    { src = gh 'stevearc/oil.nvim' },
    { src = gh 'refractalize/oil-git-status.nvim' },
    { src = gh 'folke/flash.nvim' },
    { src = gh 'akinsho/toggleterm.nvim' },

    -- syntax
    { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects' },
    { src = gh 'nvim-treesitter/nvim-treesitter-context' },
    { src = gh 'brenoprata10/nvim-highlight-colors' },

    -- utils
    { src = gh 'nvim-mini/mini.nvim' },
    { src = gh 'vyfor/cord.nvim' },
    { src = gh 'HakonHarnes/img-clip.nvim' },
    { src = gh 'obsidian-nvim/obsidian.nvim' },
    { src = gh 'wakatime/vim-wakatime' },

    -- cmp
    { src = gh 'L3MON4D3/LuaSnip' },
    { src = gh 'rafamadriz/friendly-snippets' },
    { src = gh 'saghen/blink.lib' },
    { src = gh 'saghen/blink.cmp' },
  },
}

vim.pack.add(M.specs)

require 'kovs.utils.prune'

return M
