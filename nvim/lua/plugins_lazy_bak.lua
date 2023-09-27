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
            open_fold_hl_timeout = 0,
            fold_virt_text_handler = function(text, lnum, endLnum, width)
                local suffix    = "  "
                local lines     = ('[%d lines] '):format(endLnum - lnum)

                local cur_width = 0
                for _, section in ipairs(text) do
                    cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
                end

                suffix = suffix .. (' '):rep(width - cur_width - vim.fn.strdisplaywidth(lines) - 3)

                table.insert(text, { suffix, 'Comment' })
                table.insert(text, { lines, 'Todo' })
                return text
            end,
            preview = {
                win_config = {
                    border       = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                    winblend     = 1,
                    winhighlight = "Normal:LazyNormal",
                }
            }
        },
    },
    {
        "luukvbaal/statuscol.nvim",
        init = function()
            vim.diagnostic.config({ severity_sort = true })
        end,
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                segments = {
                    relculright = true,
                    {
                        -- text = { "%C" },
                        -- click = "v:lua.ScFa",
                        --
                        -- sign = { -- table of fields that configure a sign segment
                        --     -- at least one of "name", "text", and "namespace" is required
                        --     -- legacy signs are matched against the defined sign name e.g. "DiagnosticSignError"
                        --     -- extmark signs can be matched agains either the namespace or the sign text itself
                        --     name = { ".*" }, -- table of lua patterns to match the sign name against
                        --     text = { ".*" }, -- table of lua patterns to match the extmark sign text against
                        --     namespace = { ".*" }, -- table of lua patterns to match the extmark sign namespace against
                        --     -- below values list the default when omitted:
                        --     maxwidth = 1, -- maximum number of signs that will be displayed in this segment
                        --     colwidth = 2, -- number of display cells per sign in this segment
                        --     auto = false, -- when true, the segment will not be drawn if no signs matching
                        --     -- the pattern are currently placed in the buffer.
                        --     wrap = false, -- when true, signs in this segment will also be drawn on the
                        --     -- virtual or wrapped part of a line (when v:virtnum != 0).
                        --     fillchar = " ", -- character used to fill a segment with less signs than maxwidth
                        --     fillcharhl = nil, -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
                        --     fold = { -- 'fillchars' option values:
                        --         close = "", -- foldclose
                        --         open = "", -- foldopen
                        --         sep = " " -- foldsep
                        --     },
                        -- },
                        -- { text = { "%s" }, click = "v:lua.ScSa" },
                        -- {
                        --     text = { builtin.lnumfunc, " " },
                        --     condition = { true, builtin.not_empty },
                        --     click = "v:lua.ScLa",
                        --
                        --     sign = { -- table of fields that configure a sign segment
                        --         -- at least one of "name", "text", and "namespace" is required
                        --         -- legacy signs are matched against the defined sign name e.g. "DiagnosticSignError"
                        --         -- extmark signs can be matched agains either the namespace or the sign text itself
                        --         name = { ".*" }, -- table of lua patterns to match the sign name against
                        --         text = { ".*" }, -- table of lua patterns to match the extmark sign text against
                        --         namespace = { ".*" }, -- table of lua patterns to match the extmark sign namespace against
                        --         -- below values list the default when omitted:
                        --         maxwidth = 1, -- maximum number of signs that will be displayed in this segment
                        --         colwidth = 2, -- number of display cells per sign in this segment
                        --         auto = false, -- when true, the segment will not be drawn if no signs matching
                        --         -- the pattern are currently placed in the buffer.
                        --         wrap = false, -- when true, signs in this segment will also be drawn on the
                        --         -- virtual or wrapped part of a line (when v:virtnum != 0).
                        --         fillchar = " ", -- character used to fill a segment with less signs than maxwidth
                        --         fillcharhl = nil, -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
                        --         fold = { -- 'fillchars' option values:
                        --             close = "", -- foldclose
                        --             open = "", -- foldopen
                        --             sep = " " -- foldsep
                        --         },
                        --     },
                        -- },
                        -- { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    },
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
