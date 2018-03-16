call plug#begin('~/.vimrc/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'yggdroot/indentline'
  Plug 'tpope/vim-commentary'

  " Cambiar comillas
  Plug 'tpope/vim-surround'

  " Rails
  Plug 'tpope/vim-rails'
  Plug 'kchmck/vim-coffee-script'
  Plug 'vim-ruby/vim-ruby'

  " Git
  Plug 'tpope/vim-fugitive'

  "Tagbar
  Plug 'majutsushi/tagbar'

  " Theme
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'mhartington/oceanic-next'
  Plug 'bling/vim-airline'
  Plug 'ajmwagar/vim-dues'
  Plug 'joshdick/onedark.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'rakr/vim-one'

  " Identifica si se realizacon cambios en el documentos
  Plug 'airblade/vim-gitgutter'
  " Buscar metodos
  Plug 'dyng/ctrlsf.vim'

  " Detecta los tab y espacios en blanco y los transforma
  Plug 'tpope/vim-sleuth'

  " Ordena trozo de codigo
  Plug 'junegunn/vim-easy-align'

  " Completa cuando escribes metodos, def end, if else end, etc
  Plug 'tpope/vim-endwise'
  " Repetir accion con .
  Plug 'tpope/vim-repeat'

  Plug 'kien/ctrlp.vim'

  " Procesos asincronos
  Plug 'w0rp/ale'
  Plug 'tpope/vim-sensible'

  Plug 'posva/vim-vue'

  " Autocompleate
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" ############# MAP #################
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

"Easy align config
vmap <Enter> <Plug>(EasyAlign)

" colorscheme  solarized8_dark_low
" set background=dark

set background=dark
colorscheme gruvbox

set clipboard=unnamed " copy to system clipboard

" switch between current and last buffer
nmap <leader><tab> <c-^>

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

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
