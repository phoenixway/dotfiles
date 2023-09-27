require('Comment').setup()

----------------------------------------------------------------------------
vim.keymap.set('n', '<leader>z', require('telescope').extensions.sessions_picker.sessions_picker)
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        local folder = vim.fn.stdpath('data') .. '/session/'
        vim.cmd('mksession! ' .. folder .. '/last.vim')
    end,
})
----------------------------------------------------------------------------
require("bufferline").setup {}
vim.opt.sessionoptions = { -- required
    "buffers",
    "tabpages",
    "globals",
}
----------------------------------------------------------------------------
require("scope").setup({})
require("telescope").load_extension("scope")
----------------------------------------------------------------------------
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended') -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
-- lsp.setup()
----------------------------------------------------------------------------
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end
local setup = {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    }
}
local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },             -- File Explorer
    -- ["ki"] = { "<cmd>bdelete<CR>", "Kill Buffer" }, -- Close current file
    ["m"] = { "<cmd>Mason<cr>", "Mason" },                         -- LSP Manager
    ["p"] = { "<cmd>Lazy<CR>", "Plugin Manager" },                 -- Invoking plugin manager
    ["q"] = { "<cmd>wqall!<CR>", "Quit" },                         -- Quit Neovim after saving the file
    ["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },
    ["w"] = { "<cmd>wa!<CR>", "Save all" },                        -- Save current file -- Language Support
    ["t"] = { "<cmd>ToggleTerm direction=float<CR>", "Terminal" }, -- Save current file -- Language Support
    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },          -- Node Terminal
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },          -- (Optional) Htop, If you have htop in linux
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },      -- Python Terminal
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal

        -- Play with size according to your needs.
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- Vertical Terminal
    },
    l = {
        name = "LSP",
        i = { "<cmd>LspInfo<cr>", "Info" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    }, -- Telescope
    f = {
        name = "File Search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
        t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
    },
    s = {
        name = "Search",
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
    },
}

which_key.setup(setup)
which_key.register(mappings, opts)
----------------------------------------------------------------------------
require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})
require("mason-lspconfig").setup {
    ensure_installed = {
        "marksman",
        "lua_ls",
    },
    automatic_installation = true,
}
local lspconfig = require('lspconfig')
lspconfig.marksman.setup {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { 'marksman', 'lua_ls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end
-- nvim-cmp setup
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- cmp.setup {
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
--         ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
--         -- C-b (back) C-f (forward) for snippet placeholder navigation.
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<CR>'] = cmp.mapping.confirm {
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true,
--         },
--         ['<Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, { 'i', 's' }),
--     }),
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--     },
--     window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--     },
--     {
--         { name = 'buffer' },
--     }
-- }
--
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })
--
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })
--

-------------------------------
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
----------------------------------------
local telescope = require('telescope')
telescope.setup({
    extensions = {
        heading = {
            treesitter = true,
        },
        sessions_picker = {
            sessions_dir = vim.fn.stdpath('data') .. '/session/', -- same as '/home/user/.local/share/nvim/session'
        }
    },
})
telescope.load_extension('heading')
telescope.load_extension('sessions_picker')
-------------------------------------------------------------------
require("notify")("Hi, bro!")
-------------------------------------------------------------------
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = 'expr'

require("toggleterm").setup {}
-- require("focus").setup()
-- require('todotxt-nvim').setup({
--     todo_file = '/home/roman/studio/private🔒/personal_management🚀/projecting_future/todo.txt',
--     capture = {
--         prompt = "> ",
--         alternative_priority = {
--             A = "urgent",
--             B = "main",
--             C = "important, near future",
--             D = "important",
--             E = "others",
--         },
--         width = "75%"
--     },
--     sidebar = {
--         width = 40,
--         position = "bottom"
--     },
-- })

-- lua, default settings
require("better_escape").setup {
    mapping = { "jj" },         -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
    keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
    -- example(recommended)
    -- keys = function()
    --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    -- end,
}
require("barbecue.ui").toggle(false)
require 'telescope'.load_extension('project')
-- if not package.loaded['cmp-cmdline-history'] then
--     cmp.setup.cmdline(':', {
--         sources = {
--             { name = 'cmdline_history' },
--         },
--     })
-- end
-- require("obsidian").setup({})
-- vim.g.vim_markdown_frontmatter = 1
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", "lua" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
})
----------------------------------------------------------------------------

