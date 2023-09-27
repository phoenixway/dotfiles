return {
    { 'akinsho/bufferline.nvim',       dependencies = 'nvim-tree/nvim-web-devicons' },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        'stevearc/resession.nvim',
        opts = {},
        enabled = false,
    },
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'preservim/vim-markdown',
        dependencies = { 'godlygeek/tabular' },
        enabled = true,
    },
    { "tiagovla/scope.nvim" },
    { 'samjwill/vim-bufdir' },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "willthbill/opener.nvim",
        enabled = false,
    },
    { 'RRethy/vim-illuminate' },
    { 'Pocco81/true-zen.nvim' },
    {
        "epwalsh/obsidian.nvim",
        enabled = false,
        lazy = true,
        event = {
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
    {
        "folke/zen-mode.nvim",
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        enabled = true,
    },
    { "folke/twilight.nvim" },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        -- enabled = false,
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },
    {
        'anuvyklack/pretty-fold.nvim',
        enabled = false,
        config = function()
            require('pretty-fold').setup()
        end
    },
    { 'folke/which-key.nvim', lazy = true, },
    {
        'vim-airline/vim-airline',
        -- enabled = false,
    },
    {
        'vim-airline/vim-airline-themes',
        -- enabled = false,
    },
    {

        'itchyny/lightline.vim',
        enabled = false,
    },
    { 'Mohammed-Taher/AdvancedNewFile.nvim' },
    { 'rcarriga/nvim-notify' },
    {
        "williamboman/nvim-lsp-installer",
        -- enabled = false,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        -- enabled = false,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        -- enabled = false,
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false,
    },
    {
        'L3MON4D3/LuaSnip',
        lazy = false,
    },
    { 'hrsh7th/cmp-buffer', },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    {
        'scr1pt0r/crease.vim',
        enabled = false,
    },
    { 'masukomi/vim-markdown-folding' },
    { 'Konfekt/FastFold' },
    { 'zhimsel/vim-stay' },
    { 'Jorengarenar/vim-syntaxMarkerFold' },
    {
        'wellle/context.vim',
        enabled = false,
    },
    { 'nvim-tree/nvim-tree.lua' },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        enabled = false,
        opts = {
            max_count = 20,
            max_time = 7000,
            -- restriction_mode = "hint",
        }
    },
    { 'nvim-zh/better-escape.vim' },
    {
        'wfxr/minimap.vim',
        enabled = false,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
        },
    },
    { 'crispgm/telescope-heading.nvim' },
    {
        'ggandor/lightspeed.nvim',
        dependencies = 'tpope/vim-repeat',
    },
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({})
        end
    },
    { 'rcarriga/nvim-notify' },
    { 'JoseConseco/telescope_sessions_picker.nvim' },
    {
        'echasnovski/mini.nvim',
        version = false,
        enabled = false,
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        event = "BufRead",
        keys = {
            { "zR", function() require('ufo').openAllFolds() end,               desc = "Open all folds" },
            { "zM", function() require('ufo').closeAllFolds() end,              desc = "Close all folds" },
            { "zZ", function() require('ufo').peekFoldedLinesUnderCursor() end, desc = "Peed folded lines under cursor" },
        },
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
              end,
        },
    },
    -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
    {
        "luukvbaal/statuscol.nvim",
        init = function()
            vim.diagnostic.config({ severity_sort = true })
        end,
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = true,
                segments = {
                    { text = { builtin.foldfunc },    click = "v:lua.ScFa" },
                    { text = { "%s" },                click = "v:lua.ScSa" },
                    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }
                }
            })
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            insert_mappings = true,
        }
    },

}
