require('Comment').setup()
----------------------------------------------------------------------------
-- RESESSION
local resession = require('resession')
resession.setup()
vim.keymap.set('n', '<leader>ss', resession.save)
vim.keymap.set('n', '<leader>sl', resession.load)
vim.keymap.set('n', '<leader>sd', resession.delete)

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        resession.save("last")
    end,})
require('resession').setup({
    autosave = {
        enabled = true,
        interval = 60,
        notify = true,
    },
})
----------------------------------------------------------------------------
require("bufferline").setup{}
vim.opt.sessionoptions = { -- required
    "buffers",
    "tabpages",
    "globals",
}

----------------------------------------------------------------------------
require("scope").setup({})
require("telescope").load_extension("scope")
----------------------------------------------------------------------------
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", "bash" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
})
----------------------------------------------------------------------------
local lsp = require('lsp-zero')
lsp.preset('recommended') -- (Optional) Configure lua language server for neovim 
lsp.nvim_workspace()
lsp.setup()
----------------------------------------------------------------------------
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end
local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },}}
local opts = { 
    mode = "n", -- NORMAL mode 
    prefix = "<leader>", 
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps 
    noremap = true, -- use `noremap` when creating keymaps 
    nowait = true, -- use `nowait` when creating keymaps 
}

local mappings = { 
    ["a"] = { "<cmd>Alpha<cr>", "Alpha" }, 
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, -- File Explorer 
    ["k"] = { "<cmd>bdelete<CR>", "Kill Buffer" }, -- Close current file 
    ["m"] = { "<cmd>Mason<cr>", "Mason" }, -- LSP Manager 
    ["p"] = { "<cmd>Lazy<CR>", "Plugin Manager" }, -- Invoking plugin manager 
    ["q"] = { "<cmd>wqall!<CR>", "Quit" }, -- Quit Neovim after saving the file 
    ["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" }, 
    ["w"] = { "<cmd>w!<CR>", "Save" }, -- Save current file -- Language Support 
    l = { 
        name = "LSP", i = { "<cmd>LspInfo<cr>", "Info" }, 
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
-- require("mason").setup()
require("mason").setup({ PATH = "prepend", -- "skip" seems to cause the spawning error 
})
require("mason-lspconfig").setup()
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup { ensure_installed = { "lua_ls", "rust_analyzer", "bash-language-server" }, }
require("lspconfig").lua_ls.setup {}

-------------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
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

