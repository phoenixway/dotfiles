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
        enabled = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys =
        {
            { '<C-l>', "<c-^>", desc = "Language change" },
        },

    },
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
        opts = {
            autotag = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            highlight = {
                enable = true,
                disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
            },
            incremental_selection = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ak"] = { query = "@block.outer", desc = "around block" },
                        ["ik"] = { query = "@block.inner", desc = "inside block" },
                        ["ac"] = { query = "@class.outer", desc = "around class" },
                        ["ic"] = { query = "@class.inner", desc = "inside class" },
                        ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
                        ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
                        ["af"] = { query = "@function.outer", desc = "around function " },
                        ["if"] = { query = "@function.inner", desc = "inside function " },
                        ["al"] = { query = "@loop.outer", desc = "around loop" },
                        ["il"] = { query = "@loop.inner", desc = "inside loop" },
                        ["aa"] = { query = "@parameter.outer", desc = "around argument" },
                        ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]k"] = { query = "@block.outer", desc = "Next block start" },
                        ["]f"] = { query = "@function.outer", desc = "Next function start" },
                        ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
                    },
                    goto_next_end = {
                        ["]K"] = { query = "@block.outer", desc = "Next block end" },
                        ["]F"] = { query = "@function.outer", desc = "Next function end" },
                        ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
                    },
                    goto_previous_start = {
                        ["[k"] = { query = "@block.outer", desc = "Previous block start" },
                        ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                        ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
                    },
                    goto_previous_end = {
                        ["[K"] = { query = "@block.outer", desc = "Previous block end" },
                        ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                        ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        [">K"] = { query = "@block.outer", desc = "Swap next block" },
                        [">F"] = { query = "@function.outer", desc = "Swap next function" },
                        [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
                    },
                    swap_previous = {
                        ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
                        ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
                        ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
                    },
                },
            },
        }
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
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'lukas-reineke/cmp-under-comparator',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'lukas-reineke/cmp-rg',
            {
                'onsails/lspkind-nvim',
                config = function()
                    require('lspkind').init()
                end,
            },
        },
        config = function()
            local cmp = require('cmp')
            local cmp_buffer = require('cmp_buffer')
            local compare = require('cmp.config.compare')
            local luasnip = require('luasnip')
            local icons = {
                Array = '  ',
                Boolean = '  ',
                Class = '  ',
                Color = '  ',
                Constant = '  ',
                Constructor = '  ',
                Enum = '  ',
                EnumMember = '  ',
                Event = '  ',
                Field = '  ',
                File = '  ',
                Folder = '  ',
                Function = '  ',
                Interface = '  ',
                Key = '  ',
                Keyword = '  ',
                Method = '  ',
                Module = '  ',
                Namespace = '  ',
                Null = ' ﳠ ',
                Number = '  ',
                Object = '  ',
                Operator = '  ',
                Package = '  ',
                Property = '  ',
                Reference = '  ',
                Snippet = '  ',
                String = '  ',
                Struct = '  ',
                Text = '  ',
                TypeParameter = '  ',
                Unit = '  ',
                Value = '  ',
                Variable = '  ',
            }

            luasnip.config.setup({})

            cmp.setup({
                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    format = function(entry, item)
                        item.kind = string.format('%s', icons[item.kind])
                        item.menu = ({
                            buffer = '[Buffer]',
                            luasnip = '[Snip]',
                            nvim_lsp = '[LSP]',
                            nvim_lua = '[API]',
                            path = '[Path]',
                            rg = '[RG]',
                        })[entry.source.name]
                        return item
                    end,
                },
                window = {
                    completion = {
                        border = 'rounded',
                        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                    },
                    documentation = {
                        border = 'rounded',
                        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                    },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete({}),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'nvim_lua' },
                }, {
                    {
                        name = 'buffer',
                        option = {
                            -- Complete from all visible buffers.
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end,
                        },
                    },
                }),
                sorting = {
                    comparators = {
                        -- Sort by distance of the word from the cursor
                        -- https://github.com/hrsh7th/cmp-buffer#locality-bonus-comparator-distance-based-sorting
                        function(...)
                            return cmp_buffer:compare_locality(...)
                        end,
                        compare.offset,
                        compare.exact,
                        compare.score,
                        require('cmp-under-comparator').under,
                        compare.recently_used,
                        compare.locality,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },
            })
        end,
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
    -- { 'masukomi/vim-own-folding' },
    -- { 'Konfekt/FastFold' },
    { 'zhimsel/vim-stay' },
    -- { 'Jorengarenar/vim-syntaxMarkerFold' },
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
    -- { 'nvim-zh/better-escape.vim' },
    { 'max397574/better-escape.nvim' },
    {
        'wfxr/minimap.vim',
        -- enabled = false,
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
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "VeryLazy",
        opts = {
            -- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
            -- provider_selector = function(bufnr, filetype, buftype)
            --   return { "treesitter", "indent" }
            -- end,
            -- provider_selector = function(_, filetype, buftype)
            --     return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
            --         or { "treesitter", "indent" }                           -- if file opened, try to use treesitter if available
            -- end,
            open_fold_hl_timeout = 400,
            close_fold_kinds = { "imports", "comment" },
            preview = {
                win_config = {
                    border = { "", "─", "", "", "", "─", "", "" },
                    winhighlight = "Normal:Folded",
                    winblend = 0,
                },
                mappings = {
                    scrollU = "<C-u>",
                    scrollD = "<C-d>",
                    jumpTop = "[",
                    jumpBot = "]",
                },
            },
        },
        init = function()
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            -- vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        config = function(_, opts)
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local totalLines = vim.api.nvim_buf_line_count(0)
                local foldedLines = endLnum - lnum
                local suffix = ("   %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                local rAlignAppndx =
                    math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
                suffix = ("  "):rep(rAlignAppndx) .. suffix
                table.insert(newVirtText, { suffix, "MoreMsg" })
                return newVirtText
            end
            opts["fold_virt_text_handler"] = handler
            require("ufo").setup(opts)
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
            vim.keymap.set("n", "K", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    -- vim.lsp.buf.hover()
                    vim.cmd [[ Lspsaga hover_doc ]]
                end
            end)
        end,
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
                    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                    -- {
                    --     sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
                    --     click = "v:lua.ScSa"
                    -- },
                    -- {
                    --     -- sign = { name = { "Diagnostic" }, maxwidth = 2, colwidth = 1, auto = true },
                    --     sign = { name = { "Diagnostic" } },
                    --     click = "v:lua.ScSa"
                    -- },
                    -- { text = { "%s" },                  click = "v:lua.ScSa" },
                    { text = { builtin.foldfunc },      colwidth = 2,        click = "v:lua.ScFa" },

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
    { 'junegunn/goyo.vim' },
    -- { 'junegunn/limelight.vim' },
    -- { 'preservim/vim-pencil' },
    -- -- Lua
    -- {
    --     "folke/twilight.nvim",
    --     opts = {
    --         on_open = function(win)
    --             vim.o.foldenable = false
    --         end,
    --         -- callback where you can add custom code when the Zen window closes
    --         on_close = function()
    --         end,
    --     }
    -- },
    {
        'nvim-focus/focus.nvim',
        enabled = false,
    },
    -- {
    --     'arnarg/todotxt.nvim',
    --     dependencies = 'MunifTanjim/nui.nvim',
    -- },
    { 'tpope/vim-unimpaired' },
    -- { 'svermeulen/vim-cutlass' },
    -- { 'lervag/wiki.vim' },
    -- {
    --     "theHamsta/nvim_rocks",
    --     event = "VeryLazy",
    --     build =
    --     "pip3 install --user hererocks --break-system-packages && python3 -m hererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
    --     config = function()
    --         ---- Add here the packages you want to make sure that they are installed
    --         local nvim_rocks = require "nvim_rocks"
    --         nvim_rocks.ensure_installed 'luautf8'
    --     end,
    -- },
    -- {
    --     'jakewvincent/mkdnflow.nvim',
    --     -- luarocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    --     dependencies = function()
    --         require('mkdnflow').setup()
    --     end
    -- }
    { 'nvim-telescope/telescope-project.nvim' },
    { 'dmitmel/cmp-cmdline-history',          enabled = false },
    {
        "epwalsh/obsidian.nvim",
        enabled = true,
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
            dir = "/home/roman/studio/",
            completion = {
                nvim_cmp = true,
                min_chars = 2,
                new_notes_location = "current_dir",
                prepend_note_id = true,
            },
            mappings = {},
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
                substitutions = {}
            },
            notes_subdir = "notes",
            daily_notes = {
                folder = "notes/daylies",
                date_format = "%Y-%m-%d",
                alias_format = "%B %-d, %Y",
                template = nil
            },
            note_id_func = function(title)
                local suffix = ""
                if title ~= nil then
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,
            disable_frontmatter = false,
            note_frontmatter_func = function(note)
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,
            log_level = vim.log.levels.DEBUG,
            backlinks = {
                height = 10,
                wrap = true,
            },
            follow_url_func = function(url)
                vim.fn.jobstart({ "open", url }) -- Mac OS
            end,
            -- https://github.com/Vinzent03/obsidian-advanced-uri
            -- use_advanced_uri = true,

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,
            sort_by = "modified",
            sort_reversed = true,
            open_notes_in = "current"
        }
    },
    {
        'sudormrfbin/cheatsheet.nvim',

        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    },
    { 'tpope/vim-obsession' },
    { 'puremourning/vimspector' },
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python' },
    { 'rcarriga/nvim-dap-ui' },
    { 'nvim-lua/popup.nvim' },
    { 'theHamsta/nvim-dap-virtual-text' },
    {
        'linrongbin16/lsp-progress.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lsp-progress').setup()
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    { "rcarriga/nvim-dap-ui",  dependencies = { "mfussenegger/nvim-dap" } },
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = "screen"
        end,
        opts = {
        }
    },
    { 'echasnovski/mini.nvim', version = false },
    -- {
    --     'karb94/neoscroll.nvim',
    --     opts = {
    --         -- All these keys will be mapped to their corresponding default scrolling animation
    --         mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --             '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    --         hide_cursor = true,          -- Hide cursor while scrolling
    --         stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --         respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --         easing_function = nil,       -- Default easing function
    --         pre_hook = nil,              -- Function to run before the scrolling animation starts
    --         post_hook = nil,             -- Function to run after the scrolling animation ends
    --         performance_mode = false,    -- Disable "Performance Mode" on all buffers.
    --     },
    -- },
    -- { "lukas-reineke/virt-column.nvim", opts = {} },
    {
        "danielfalk/smart-open.nvim",
        config = function()
            require("telescope").load_extension("smart_open")
            vim.keymap.set("n", "<leader><leader>", function()
                require("telescope").extensions.smart_open.smart_open()
            end, { noremap = true, silent = true })
        end,
        dependencies = {
            "kkharji/sqlite.lua",
            -- Only required if using match_algorithm fzf
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    },
    {
        'lewis6991/satellite.nvim',
        opts = {},
    },
    {
        'yuttie/comfortable-motion.vim',
    },
    --     {
    --     'petertriho/nvim-scrollbar' ,
    --     dependencies = {'kevinhwang91/nvim-hlslens'},
    --     config = function(_, opts)
    --         require("scrollbar").setup(opts)
    --
    --     end,
    -- },
    -- {
    --     "kevinhwang91/nvim-hlslens",
    --     config = function(_)
    --         require("hlslens").setup({
    --             build_position_cb = function(plist, _, _, _)
    --                 require("scrollbar.handlers.search").handler.show(plist.start_pos)
    --             end,
    --         })
    --
    --         vim.cmd([[
    --             augroup scrollbar_search_hide
    --                 autocmd!
    --                 autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    --             augroup END
    -- ]])
    --     end,
    -- }

}
