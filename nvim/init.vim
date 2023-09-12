if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim' , { 'as': 'dracula' }
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  " Plug 'petertriho/nvim-scrollbar'
  " Plug 'nanozuki/tabby.nvim'
  " Plug 'morhetz/gruvbox'
  " Plug 'ncm2/ncm2'
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'
  Plug 'tiagovla/scope.nvim'
  " Plug 'jeetsukumaran/vim-buffergator'
  " Plug 'nvim-tree/nvim-tree.lua'
  Plug 'SidOfc/mkdx'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-obsession'
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
  Plug 'samjwill/vim-bufdir'
  " Plug 'duane9/nvim-rg'
  " Plug 'Shougo/denite.nvim'
  Plug 'godlygeek/tabular'
  " Plug 'roxma/nvim-yarp'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'rstacruz/vim-closer'
  " Improved motion in Vim
  Plug 'easymotion/vim-easymotion'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'Valloric/YouCompleteMe'
  Plug 'rakr/vim-one'
  Plug 'neovim/nvim-lspconfig' 
  Plug 'hrsh7th/cmp-nvim-lsp' 
  Plug 'hrsh7th/cmp-buffer' 
  Plug 'hrsh7th/cmp-path' 
  Plug 'hrsh7th/cmp-cmdline' 
  Plug 'hrsh7th/nvim-cmp' 
  " For vsnip users. 
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip' 
  " For luasnip users. " 
  Plug 'L3MON4D3/LuaSnip' 
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'SirVer/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'dcampos/nvim-snippy'
  Plug 'dcampos/cmp-snippy'

call plug#end()
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
EOF

set clipboard=unnamed

set expandtab
set autochdir
set softtabstop=2
set shiftwidth=2

" === NERDTree === "
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufReadPost *
            \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal g`\"" |
            \ endif
let g:vim_markdown_conceal = 1

autocmd Bufread *.md setlocal conceallevel=2
set foldenable
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_edit_url_in = 'tab'
autocmd Bufread *.md setlocal textwidth=0
autocmd Bufread *.md set nonumber
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
                                       " plugin which unfortunately interferes with mkdx list indentation.

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" set foldmethod=indent
" set foldlevel=99
" filetype plugin on  " must be before `syntax enable`
" syntax enable
" set foldmethod=syntax
" nnoremap <space> za

" au BufNewFile,BufRead *.py
"       \ set tabstop=4
"       \ set softtabstop=4
"       \ set shiftwidth=4
"       \ set textwidth=79
"       \ set expandtab
"       \ set autoindent
"       \ set fileformat=unix

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1

" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
" ===========================================

let NERDTreeQuitOnOpen=0
set nu

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set completeopt=menu,menuone,noselect 
set signcolumn=yes
"=================================================================================================================
"MAPPING
"=================================================================================================================
nnoremap <SPACE> <Nop>
let mapleader=" "

map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

nnoremap <C-t> :NvimTreeToggle %:p:h<CR>
nnoremap <C-s> :w<CR><CR>
inoremap <C-s> <ESC>:w<CR><CR>
nnoremap <C-q> :q<CR>
" nnoremap <C-b> :Telescope scope buffers<CR>
nnoremap <C-o> :Telescope find_files search_dirs={"~/studio"}<CR>
" nnoremap <C-a> <cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>
"
inoremap jj <esc>
nnoremap ; :
nnoremap : ;
nnoremap <c-left> :bprev<CR>
nnoremap <c-a-w> :bd<CR>
inoremap <ESC> <ESC>:set iminsert=0<CR>
nnoremap <ESC> <ESC>:set iminsert=0<CR>
" inoremap <left> :bprev<CR>
nnoremap <c-right> :bnext<CR>
" inoremap <right> :bnext<CR>
" nnoremap z :

nnoremap <L-j> :bprev<CR>
nnoremap <L-k> :bnext<CR>
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

map <Enter> o<ESC>
map <S-Enter> O<ESC>

noremap <c-k> :m -2<CR>
noremap <c-j> :m +1<CR>

nmap <C-S-Up> :m -2<CR>
nmap <C-S-Down> :m +1<CR>

nmap <C-UP> :m-2<CR>
nmap <C-DOWN> :m+1<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"=================================================================================================================
"LOAD LUA CONFIG FILES
"=================================================================================================================
" lua require('plugins')
lua require('init')
lua require('lazy-config')
lua require('config-lazy-plugins')
"=================================================================================================================
" LAST
"=================================================================================================================
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
"=================================================================================================================
let hour = strftime("%H")
if 6 <= hour && hour < 18
    set background=light
    colorscheme catppuccin
    let g:airline_theme = "cobalt2"
    AirlineTheme cobalt2
 else
    set background=dark
    let g:airline_theme='tomorrow'
    colorscheme catppuccin 
endif
"=================================================================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif " unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ' 
let g:airline_left_sep = ''
let g:airline_left_alet_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
set cmdheight=0

set keymap=ukrainian-jcuken
inoremap <c-l> <c-^>
" inoremap / .
" inoremap . /
" inoremap ? ,
" inoremap , ?
set iminsert=1 imsearch=0

" set foldcolumn=0
set foldlevelstart=0
set foldmarker=\ {{{,\ }}}

" set fillchars=fold:━
" let g:crease_foldtext = { 'default': '%f%f┫ %t%{CreaseChanged()} ┣%=┫ %l lines ┣%f%f' }

" function! CreaseChanged()
"     return gitgutter#fold#is_changed() ? ' *' : ''
" endfunction

" set fillchars=fold:\ 
"
" function! FoldIsCommented()  
"   return luaeval("require('fold').foldIsCommented()")
" endfunction  
"
" function! IsMod()
"   if exists('g:loaded_gitgutter')
"     return gitgutter#fold#is_changed() ? g:modified_label  : ' '
"   else
"     return ''
"   endif
" endfunction 
"
" function! CreaseIndent() abort   
"   let fs = nextnonblank(v:foldstart)    
"   let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')  
"   let foldLevelStr = repeat(' ', match(line,'\S'))  
"   return foldLevelStr    
" endfunction    
"
"
" function! CountFoldText() abort   
"   let foldCnt = luaeval("require('fold').countChildFolds()")
"   if l:foldCnt < 0 
"     return '' 
"   endif
"   return l:foldCnt == 0 ? '' : '' . l:foldCnt . " " . g:fold_label . ' · '
" endfunction
"
" function! Cmmtd() abort 
"   return FoldIsCommented() ? g:commented_label : ''
" endfunction 
"
" function! FoldTxt() abort 
"   return trim(substitute(
" 	\ getline(v:foldstart),
" 	\ '\V\C'
" 	\ . join(split(&commentstring, '%s'), '\|') . '\|'
" 	\ . join(split(&foldmarker, ','), '\d\?\|') . '\|'
" 	\ . join(g:foldtext_stop_words, '\|') . '\|',
" 	\ '',
" 	\ 'g'
" 	\ ))
" endfunction 
"

let g:fold_label = ' '
let g:commented_label = ' '
let g:lines_label = 'lines'
let g:modified_label = ' ' " alt : ' '

let g:foldtext_stop_words = [
      \ '\^function',
      \ '!',
      \ 'abort',
      \ ]

let g:crease_foldtext = {  
      \ 'default': '%{CreaseIndent()}%{FoldTxt()} %{IsMod()} %{Cmmtd()} %= %{CountFoldText()}%l '.g:lines_label.' %f%f%f%f',
      \}
"--------------------------------------------------------------------
" set nocompatible 
" if has("autocmd") 
"     filetype plugin indent on 
" endif
" autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

