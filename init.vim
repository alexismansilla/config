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

  " Theme
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mhartington/oceanic-next'
  Plug 'bling/vim-airline'
  Plug 'ajmwagar/vim-dues'
  Plug 'joshdick/onedark.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'
  Plug 'skielbasa/vim-material-monokai'
call plug#end()

set background=dark
set termguicolors
colorscheme material-monokai

" set background=dark
" colorscheme palenight

let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:airline_theme='materialmonokai'
let g:materialmonokai_subtle_airline=1
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:move_key_modifier = 'C'
" colorscheme gruvbox
" set background=dark
" colorscheme solarized8_dark
" background solarized8_dark
"
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :only<CR>
nnoremap <CR> G
nnoremap <BS> gg
vnoremap < <gv
vnoremap > >gv
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
syntax on
filetype plugin indent on
nmap <silent> <BS> :nohlsearch<CR>

" switch between current and last buffer
nmap <leader><tab> <c-^>

"Easy align config
vmap <Enter> <Plug>(EasyAlign)


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

vmap     <Leader>f <Plug>CtrlSFVwordExec

autocmd! User FzfStatusLine call <SID>fzf_statusline()
map <C-P> :FZF<CR>
map <Leader>b :Buffers <CR>
map <Leader>h :History <CR>

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
set background=dark
set clipboard=unnamed " copy to system clipboard
set noswapfile

" Strip trailing whitespace
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

function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>

nnoremap gA :OpenURL http://www.answers.com/search?q=<cword><CR>

:nmap <silent> <leader>d <Plug>DashSearch

" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

noremap K :Ag! <C-r>=expand('<cword>')<CR><CR>
nnoremap \ :Ag<SPACE>

" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>m :NERDTreeFind<cr>

let NERDTreeShowHidden=0
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI = 1
