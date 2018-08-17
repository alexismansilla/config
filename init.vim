call plug#begin('~/.vimrc/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  " https://github.com/wokalski/autocomplete-flow
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'yggdroot/indentline'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-rails'
  Plug 'kchmck/vim-coffee-script'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-fugitive'
  Plug 'majutsushi/tagbar'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-sleuth'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-repeat'
  Plug 'kien/ctrlp.vim'
  Plug 'w0rp/ale'
  Plug 'tpope/vim-sensible'
  Plug 'posva/vim-vue'
  Plug 'fvictorio/vim-extract-variable'
  Plug 'vimwiki/vimwiki'
  Plug 'itchyny/vim-cursorword'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-haml'
  Plug 'dhruvasagar/vim-open-url'
  Plug 'rizzatti/dash.vim'
  Plug 'dkprice/vim-easygrep'
  Plug 'dyng/ctrlsf.vim'
  Plug 'ervandew/supertab'

  " Test
  Plug 'szw/vim-g'
  Plug 'ruanyl/vim-gh-line'

  " Theme
  Plug 'tyrannicaltoucan/vim-quantum'
  Plug 'icymind/NeoSolarized'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'morhetz/gruvbox'
  Plug 'mhartington/oceanic-next'
  Plug 'bling/vim-airline'
  Plug 'ajmwagar/vim-dues'
  Plug 'joshdick/onedark.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'rakr/vim-one'
  Plug 'skielbasa/vim-material-monokai'
call plug#end()

let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
filetype plugin indent on

" switch between current and last buffer
nmap <leader><tab> <c-^>

vmap <Enter> <Plug>(EasyAlign)

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


set background=dark
set termguicolors
"
" Themes
"
" ------------------------------------------|
" Gruvbox
"
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italicize_comments = 1

" Material-Monokai
"
colorscheme material-monokai
let g:materialmonokai_italic         = 1
let g:materialmonokai_subtle_spell   = 1
let g:airline_theme                  = 'materialmonokai'
let g:materialmonokai_subtle_airline = 1

" Solarized
"
" colorscheme NeoSolarized

" let g:neosolarized_contrast               = "dark"
" let g:neosolarized_vertSplitBgTrans       = 1

" let g:deoplete#enable_at_startup          = 1
" let g:neosnippet#enable_completed_snippet = 1
" let g:move_key_modifier                   = 'C'

" Quantum
"
" let g:quantum_black=1
" colorscheme quantum
" let g:quantum_italics = 1
" let g:airline_theme   = 'quantum'

" ------------------------------------------|
