local gh = function(x)
  return 'https://github.com/' .. x
end

local M = {
  specs = {
    -- appearance
    { src = gh 'rose-pine/neovim' },
    { src = gh 'neanias/everforest-nvim' },
    { src = gh 'ficcdaf/ashen.nvim' },
    { src = gh 'kepano/flexoki-neovim' },
    { src = gh 'nvim-mini/mini.statusline' },
    { src = gh 'sphamba/smear-cursor.nvim' },
    { src = gh 'vimpostor/vim-tpipeline' },
    { src = gh 'NStefan002/screenkey.nvim' },
    { src = gh 'MeanderingProgrammer/render-markdown.nvim' },
    { src = gh 'nvim-mini/mini.starter' },
    { src = gh 'stevearc/dressing.nvim' },

    -- editing
    { src = gh 'JoosepAlviste/nvim-ts-context-commentstring' },
    { src = gh 'windwp/nvim-ts-autotag' },
    { src = gh 'lewis6991/gitsigns.nvim' },
    { src = gh 'saecki/crates.nvim' },
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
    { src = gh 'pmizio/typescript-tools.nvim' },
    { src = gh 'neovim/nvim-lspconfig' },
    { src = gh 'mrcjkb/rustaceanvim' },
    { src = gh 'adibhanna/laravel.nvim' },
    { src = gh 'ricardoramirezr/blade-nav.nvim' },
    { src = gh 'linux-cultist/venv-selector.nvim' },
    { src = gh 'karloskar/poetry-nvim' },
    { src = gh 'rachartier/tiny-code-action.nvim' },

    -- navigation
    { src = gh 'folke/snacks.nvim' },
    { src = gh 'ThePrimeagen/harpoon' },
    { src = gh 'folke/which-key.nvim' },
    { src = gh 'folke/trouble.nvim' },
    { src = gh 'stevearc/oil.nvim' },
    { src = gh 'refractalize/oil-git-status.nvim' },
    { src = gh 'folke/flash.nvim' },
    { src = gh 'akinsho/toggleterm.nvim' },

    -- syntax
    { src = gh 'IlyasYOY/ts-pack.nvim' },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects' },
    { src = gh 'nvim-treesitter/nvim-treesitter-context' },
    { src = gh 'brenoprata10/nvim-highlight-colors' },

    -- utils
    { src = gh 'nvim-mini/mini.nvim' },
    { src = gh 'mistweaverco/kulala.nvim' },
    { src = gh 'oysandvik94/curl.nvim' },
    { src = gh 'vyfor/cord.nvim' },
    { src = gh 'HakonHarnes/img-clip.nvim' },
    { src = gh 'obsidian-nvim/obsidian.nvim' },
    { src = gh 'wakatime/vim-wakatime' },

    -- cmp
    { src = gh 'L3MON4D3/LuaSnip' },
    { src = gh 'rafamadriz/friendly-snippets' },
    { src = gh 'saghen/blink.lib' },
    { src = gh 'saghen/blink.cmp' },
    { src = gh 'folke/lazydev.nvim' },
  },
}

vim.pack.add(M.specs)

return M
