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
        marks = true,         
        registers = true,     
        spelling = {
            enabled = true,   
            suggestions = 20, 
        },
    }
}
local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
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
    PATH = "prepend",
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
        width = 50,
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
-- vim.o.foldcolumn = '1' 
-- vim.o.foldlevel = 99   
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.foldmethod = 'expr'

require("toggleterm").setup {}

require("better_escape").setup {
    mapping = { "jj" },         
    timeout = vim.o.timeoutlen, 
    clear_empty_lines = false,  
    keys = "<Esc>",             
}
require("barbecue.ui").toggle(false)
require 'telescope'.load_extension('project')

vim.g.vim_markdown_frontmatter = 1
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", "lua", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
    disable = function(lang, bufnr) 
      return vim.api.nvim_buf_line_count(bufnr) > 100
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
    bundled_cheatsheets = true,
    bundled_plugin_cheatsheets = true,
    include_only_installed_plugins = true,
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require("nvim-dap-virtual-text").setup()
------------------------------------------------------------------------------
-- local builtin = require("statuscol.builtin")
-- require("statuscol").setup({
--   relculright = true,
--   segments = {
--     {
--       sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
--       click = "v:lua.ScSa"
--     },
--     { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
--     { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
--     {
--       sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
--       click = "v:lua.ScSa"
--     },
--   }
-- })
-- require("hlslens").setup({
--     build_position_cb = function(plist, bufnr, changedtick, pattern)
--         require('scrollbar').search_handler.show(plist.start_pos)
--     end
-- })

-- vim.cmd([[
--     augroup scrollbar_search_hide
--       autocmd!
--       autocmd CmdlineLeave : lua require('scrollbar').search_handler.hide()
--     augroup END
-- ]])
