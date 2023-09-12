return {
    { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
      'stevearc/resession.nvim',
      opts = {},
    },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- { 'smartpde/telescope-recent-files', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'preservim/vim-markdown', 
        dependencies = { 'godlygeek/tabular' },
        enabled = false,
    },
    { 'preservim/nerdtree'},
    { "tiagovla/scope.nvim" },
    { 'samjwill/vim-bufdir'},
    { 
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { 
            "nvim-telescope/telescope.nvim", 
            "nvim-lua/plenary.nvim" 
        },
    },
    { "willthbill/opener.nvim", 
        enabled = false,
    },
    { 'RRethy/vim-illuminate' },
    { 'Pocco81/true-zen.nvim' },
    { "epwalsh/obsidian.nvim", 
        lazy = true, 
        event = { 
            "BufReadPre " .. vim.fn.expand "~" .. "/home/roman/studio/**.md",
            "BufReadPre /home/roman/studio/**.md", 
            "BufNewFile /home/roman/studio/**.md", 
        }, 
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        }, 
        opts = { 
            dir = "~/studio",
            completion = { 
                nvim_cmp = true, 
                min_chars = 2,
                new_notes_location = "current_dir",
                prepend_note_id = true,
            },
        }, 
    },
    { 'Mofiqul/dracula.nvim' },
    { 'dkarter/bullets.vim' },
    { "folke/zen-mode.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        enabled = true,
    },
    { "folke/twilight.nvim" },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },
    {
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup()
        end
    },
    { 
        'VonHeikemen/lsp-zero.nvim', 
        dependencies = {
            -- LSP Support 
            {'neovim/nvim-lspconfig'}, -- Required 
            {'williamboman/mason.nvim'}, -- Optional 
            {'williamboman/mason-lspconfig.nvim'}, -- Optional -- Autocompletion 
            {'hrsh7th/nvim-cmp'}, -- Required 
            {'hrsh7th/cmp-nvim-lsp'}, -- Required 
            {'hrsh7th/cmp-buffer'}, -- Optional 
            {'hrsh7th/cmp-path'}, -- Optional 
            {'saadparwaiz1/cmp_luasnip'}, -- Optional 
            {'hrsh7th/cmp-nvim-lua'}, -- Optional -- Snippets 
            {'L3MON4D3/LuaSnip'}, -- Required 
            {'rafamadriz/friendly-snippets'}, -- Optional 
        } 
    },
    { 'folke/which-key.nvim', lazy = true, },
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },
    { 'Mohammed-Taher/AdvancedNewFile.nvim' },
    { 'rcarriga/nvim-notify' },
    { "williamboman/nvim-lsp-installer" }, 
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim", },
    { "neovim/nvim-lspconfig" },
    { 
        'scr1pt0r/crease.vim',
        enabled = false,
    },
    { 'masukomi/vim-markdown-folding' },
    { 'Konfekt/FastFold' },
    { 'zhimsel/vim-stay' },
    { 'Jorengarenar/vim-syntaxMarkerFold' },
    { 'wellle/context.vim' },
    { 'nvim-tree/nvim-tree.lua' },

}



