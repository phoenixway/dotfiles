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
    ["k"] = { "<cmd>bdelete<CR>", "Kill Buffer" }, -- Close current file
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
-------------------------------
--
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

require("better_escape").setup {
    mapping = { "jj" },         -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
    keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
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
vim.g.vim_markdown_frontmatter = 1
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", "lua", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
    disable = function(lang, bufnr) 
      return vim.api.nvim_buf_line_count(bufnr) > 50000
    end,
  },
})
----------------------------------------------------------------------------
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

----------------------------------------------------------------------------
require("cheatsheet").setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },
    bundled_cheatsheets = true,

    -- For plugin specific cheatsheets
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }
    bundled_plugin_cheatsheets = true,

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,

    -- Key mappings bound inside the telescope window
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
