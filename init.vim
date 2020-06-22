call plug#begin('~/.vimrc/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'yggdroot/indentline'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-repeat'
  Plug 'kien/ctrlp.vim'
  Plug 'w0rp/ale'
  Plug 'tpope/vim-sensible'
  Plug 'itchyny/vim-cursorword'

  Plug 'fvictorio/vim-extract-variable'
  Plug 'rizzatti/dash.vim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'ervandew/supertab'
  Plug 'vimwiki/vimwiki'
  Plug 'szw/vim-g'
  Plug 'ruanyl/vim-gh-line'
  Plug 'terryma/vim-multiple-cursors'

  Plug 'janko/vim-test'

  Plug 'kchmck/vim-coffee-script'
  Plug 'mileszs/ack.vim'

  " Theme
  Plug 'bling/vim-airline'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'icymind/NeoSolarized'
  Plug 'morhetz/gruvbox'
  Plug 'mhartington/oceanic-next'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'cormacrelf/vim-colors-github'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'KeitaNakamura/neodark.vim'
call plug#end()

let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
filetype plugin indent on


vmap <Enter> <Plug>(EasyAlign)

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#ruby#rspec#executable = 'rspecb'
"
" Main configuration
"
" ------------------------------------------|
let mapleader = "\<Space>"

set shell=zsh
set laststatus=2
set nowrap         " don't wrap lines
set tabstop=2      " a tab is two spaces
set shiftwidth=2   " an autoindent (with <<) is two spaces
set softtabstop=2  " if we have smart tabs, treat like hard tabs
set expandtab      " Use spaces instead of tags
set list           " Show invisible characters
set lazyredraw
set ttyfast
set number
set textwidth=100
set colorcolumn=+1
set clipboard=unnamed " copy to system clipboard
set hlsearch
set ignorecase
set smartcase
set noswapfile

" Folder method
" Select the block next zf for create a collapse
set foldmethod=manual
" Folder method

syntax on

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :only<CR>
nnoremap <CR> G
nnoremap <BS> gg
vnoremap < <gv
vnoremap > >gv
" ------------------------------------------|


"
" CtrlP (new mapping)
"
" ------------------------------------------|
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
" ------------------------------------------|

" Fzf
"
" ------------------------------------------|
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
map <C-P> :FZF<CR>
map <Leader>b :Buffers <CR>
map <Leader>h :History <CR>
map <Leader>t :BTags <CR>
" ------------------------------------------|

"
" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
"
" ------------------------------------------|
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

noremap K :Ag! <C-r>=expand('<cword>')<CR><CR>
nnoremap \ :Ag<SPACE>
" ------------------------------------------|


"
" CtrlSF Global Word Search
"
" ------------------------------------------|
vmap <Leader>f <Plug>CtrlSFVwordExec
nmap <silent> <BS> :nohlsearch<CR>
" ------------------------------------------|


"
" Dash integration
"
" ------------------------------------------|
:nmap <silent> <leader>d <Plug>DashSearch
" ------------------------------------------|


"
" Strip trailing whitespace
"
" ------------------------------------------|
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" ------------------------------------------|
"
" NERDtree
"
" ------------------------------------------|
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>m :NERDTreeFind<cr>

let g:NERDTreeWinPos     = "right"
let NERDTreeShowHidden   = 0
let g:NERDTreeWinSize    = 30
let g:NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI    = 1
let g:vim_g_command      = "G"
let g:nerdtree_tabs_focus_on_files = 1
" ------------------------------------------|


"
" Rubocop
"
" ------------------------------------------|
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>
" ------------------------------------------|


let g:airline#extensions#tabline#formatter = 'jsformatter'


"
" switch between current and last buffer
"
" ------------------------------------------|
nmap <leader><tab> <c-^>
" ------------------------------------------|


" set background=light
" set background=dark
set termguicolors
"
" Themes
"
" ------------------------------------------|
" let g:airline_theme='one'
" set background=light
" let g:one_allow_italics = 1
" colorscheme one

" Gruvbox
colorscheme gruvbox
set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italicize_comments = 1

" Dracula
" color dracula

" Material-Monokai
" colorscheme material-monokai
" let g:materialmonokai_italic         = 1
" let g:materialmonokai_subtle_spell   = 1
" let g:airline_theme                  = 'materialmonokai'
" let g:materialmonokai_subtle_airline = 1

" GitHub
 " let g:github_colors_block_diffmark = 0
 " let g:airline_theme = "github"
 " let g:lightline = { 'colorscheme': 'github' }
 " colorscheme github

" Monokai
" colorscheme vim-monokai-tasty
" let g:vim_monokai_tasty_italic = 1
" let g:airline_theme='monokai_tasty'

" NeoDark
" colorscheme neodark
" let g:neodark#terminal_transparent = 1
" let g:neodark#solid_vertsplit = 1
" let g:lightline = {}
" let g:lightline.colorscheme = 'neodark'

" Solarized
" colorscheme NeoSolarized
" let g:neosolarized_contrast               = "light"
" let g:neosrized_contrast               = "dark"
" let g:neosolarized_vertSplitBgTrans       = 1
" let g:deoplete#enable_at_startup          = 1
" let g:neosnippet#enable_completed_snippet = 1
" let g:move_key_modifier                   = 'C'
" ------------------------------------------|
"

