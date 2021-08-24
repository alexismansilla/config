syntax on

let mapleader = ","

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

call plug#begin('~/.config/nvim/plugged') 
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'dominikduda/vim_current_word'
  Plug 'tpope/vim-endwise'
  Plug 'thaerkh/vim-indentguides'
  Plug 'tpope/vim-rails'

  Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" System 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :only<CR>
nnoremap <CR> G
nnoremap <BS> gg
vnoremap < <gv
vnoremap > >gv
" ------------------------------------------|


" NERDtree
map <silent><leader>n :NERDTreeToggle<CR>
map <silent><leader>m :NERDTreeFind<cr>

let g:NERDTreeWinPos     = "right"
" ------------------------------------------|
"
set termguicolors
color dracula
