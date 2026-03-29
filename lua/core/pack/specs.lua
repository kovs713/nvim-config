return {
  -- appearance
  { src = 'stevearc/dressing.nvim' },
  { src = 'nvim-mini/mini.starter' },
  { src = 'nvim-mini/mini.statusline' },
  { src = 'MeanderingProgrammer/render-markdown.nvim' },
  { src = 'NStefan002/screenkey.nvim' },
  { src = 'rose-pine/neovim', name = 'rose-pine' },
  { src = 'vimpostor/vim-tpipeline' },

  -- editing
  { src = 'bullets-vim/bullets.vim' },
  { src = 'numToStr/Comment.nvim' },
  { src = 'saecki/crates.nvim', version = 'stable' },
  { src = 'lewis6991/gitsigns.nvim' },
  { src = 'windwp/nvim-ts-autotag' },
  { src = 'JoosepAlviste/nvim-ts-context-commentstring' },
  { src = 'ThePrimeagen/refactoring.nvim' },

  -- formatting
  { src = 'stevearc/conform.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'mfussenegger/nvim-lint' },
  { src = 'tpope/vim-sleuth' },

  -- lsp
  { src = 'williamboman/mason-lspconfig.nvim' },
  { src = 'williamboman/mason.nvim' },
  { src = 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'neovim/nvim-lspconfig' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'saghen/blink.cmp', version = vim.version.range '1' },
  { src = 'L3MON4D3/LuaSnip', version = vim.version.range '2' },
  { src = 'rafamadriz/friendly-snippets' },
  { src = 'folke/lazydev.nvim' },
  { src = 'moyiz/blink-emoji.nvim' },
  { src = 'mfussenegger/nvim-dap' },
  { src = 'rcarriga/nvim-dap-ui' },
  { src = 'nvim-neotest/nvim-nio' },
  { src = 'jay-babu/mason-nvim-dap.nvim' },
  { src = 'leoluz/nvim-dap-go' },
  { src = 'mrcjkb/rustaceanvim', version = vim.version.range '8' },
  { src = 'rachartier/tiny-code-action.nvim' },

  -- navigation
  { src = 'folke/flash.nvim' },
  { src = 'thePrimeagen/harpoon', version = 'harpoon2' },
  { src = 'stevearc/oil.nvim' },
  { src = 'folke/snacks.nvim' },
  { src = 'folke/trouble.nvim' },
  { src = 'folke/which-key.nvim' },

  -- syntax
  { src = 'yousefhadder/markdown-plus.nvim' },
  { src = 'brenoprata10/nvim-highlight-colors' },
  { src = 'roobert/tailwindcss-colorizer-cmp.nvim' },
  { src = 'NvChad/nvim-colorizer.lua' },
  { src = 'nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'pmizio/typescript-tools.nvim' },

  -- utils
  { src = 'vyfor/cord.nvim' },
  { src = 'HakonHarnes/img-clip.nvim' },
  { src = 'nvim-mini/mini.nvim' },
  { src = 'obsidian-nvim/obsidian.nvim' },
  { src = 'wakatime/vim-wakatime' },

  -- utils/http
  { src = 'oysandvik94/curl.nvim' },
  { src = 'mistweaverco/kulala.nvim' },
  { src = 'rest-nvim/rest.nvim' },

  -- shared deps
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'nvim-mini/mini.icons' },
}
