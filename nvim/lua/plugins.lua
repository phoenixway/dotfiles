local function nmap(comb, cmd, desc)
        vim.api.nvim_set_keymap('n', comb, cmd, {noremap = true, silent = true, desc = desc})
end
require'packer.luarocks'.install_commands()
vim.cmd [[packadd packer.nvim]]
vim.api.nvim_cmd({ cmd = 'colorscheme', args = {'dracula'} }, {})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use "nvim-lua/plenary.nvim"
  -- use 'nanozuki/tabby.nvim'
  -- use 'nvim-tree/nvim-web-devicons'
  use 'rstacruz/vim-closer'
  use "willthbill/opener.nvim"
  -- use {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- }
  use {
  'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  -- use("petertriho/nvim-scrollbar")

  -- use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  -- use {
  --   "kevinhwang91/nvim-hlslens",
  --   config = function()
  --     require("scrollbar.handlers.search").setup({
  --     })
  --   end,
  -- }
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use({
  "princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  requires = {"nvim-telescope/telescope.nvim"},
  config = function()
    require("dir-telescope").setup({
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    })
  end,
})

  -- use {
  --     'stevearc/resession.nvim',
  --     config = function()
  --         require('resession').setup()
  --     end,
  --     lazy = false,
  --     dependencies = { { "tiagovla/scope.nvim", lazy = false, config = true, }, },
  --     opts = {
  --         -- override default filter
  --         buf_filter = function(bufnr)
  --             local buftype = vim.bo[bufnr].buftype
  --             if buftype == 'help' then
  --                 return true
  --             end
  --             if buftype ~= "" and buftype ~= "acwrite" then
  --                 return false
  --             end
  --             if vim.api.nvim_buf_get_name(bufnr) == "" then
  --                 return false
  --             end
  --             -- this is required, since the default filter skips nobuflisted buffers
  --             return true
  --         end,
  --         extensions = { scope = {} },
  --         -- add scope.nvim extension
  --         }
  -- }
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
  -- use {'dracula/vim', as = 'dracula'}

  require('telescope').load_extension("opener")
  require('telescope').setup {
    extensions = {
      opener = {
        hidden = true,
        -- root_dir = "~",
        respect_gitignore = true, -- respect .gitignore files
      }
    }
  }
end)

