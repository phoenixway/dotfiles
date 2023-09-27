-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.showtabline = 2
vim.opt.termguicolors = true

vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })

-- cmp.setup
-- ({
--     -- You must set mapping if you want. 
--     mapping = { 
--         ['<C-Space>'] = cmp.mapping.complete(), 
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-e>'] = cmp.mapping.close(),
--         ['<CR>'] = cmp.mapping.confirm({ 
--             behavior = cmp.ConfirmBehavior.Insert, select = true, }), 
--         }, -- You should specify your *installed* sources. 
--         sources = { { name = 'buffer' }, }, 
-- })
-- local api = require("nvim-tree.api")
-- local global_cwd = vim.fn.getcwd(-1, -1)
-- api.tree.change_root(global_cwd)

-- require("scope").setup({})
-- require("telescope").load_extension("scope")
-- require("scrollbar").setup()

-- local builtin = require("telescope.builtin")
-- local utils = require("telescope.utils")
-- ["<leader>fq"] = { function() builtin.find_files({ cwd = utils.buffer_dir() }) end, desc = "Find files in cwd" }
--
