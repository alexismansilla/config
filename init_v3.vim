syntax on

let mapleader = " "

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
set mouse=nicr

call plug#begin('~/.config/nvim/plugged') 
  " Tree
  Plug 'scrooloose/nerdtree'

  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'

  " IDE
  Plug 'mileszs/ack.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'thaerkh/vim-indentguides'
  Plug 'itchyny/vim-cursorword'
  Plug 'kien/ctrlp.vim'
  Plug 'elzr/vim-json'

  " autocomplete
  Plug 'sirver/ultisnips'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Theme 
  Plug 'dracula/vim', { 'as': 'dracula' }

  " syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " typing
  Plug 'alvan/vim-closetag'

  Plug 'mlaursen/vim-react-snippets'
  Plug 'mlaursen/rmd-vim-snippets'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'terryma/vim-multiple-cursors'

  " Formatting/colors
  Plug 'hail2u/vim-css3-syntax' 
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'pangloss/vim-javascript'
call plug#end()

set termguicolors
color dracula

let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
let g:vim_jsx_pretty_colorful_config = 1 " default 0
" Better display for messages
set cmdheight=1
set nobackup
set nowritebackup

" System 
nmap <leader><tab> <c-^>
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
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['^node_modules$']
" ------------------------------------------|

" CtrlP (new mapping)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

nnoremap <silent> <C-h> :CtrlPBuffer<CR>
" ------------------------------------------|
"
"" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
" ------------------------------------------|
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

noremap K :Ag! <C-r>=expand('<cword>')<CR><CR>
nnoremap ` :Ag<SPACE>
" ------------------------------------------|
"
"" Fzf
" ------------------------------------------|
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatus

" ------------------------------------------|
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> fr <Plug>(coc-rename)

" Trigger configuration. Do not use <tab>
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-_>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Remap for do codeAction of current line
nmap <leader>,  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>.  <Plug>(coc-fix-current)

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-react-refactor',
      \ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Show all diagnostics
nnoremap <silent> <space>[  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>]  :<C-u>CocList outline<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd FileType scss setl iskeyword+=@-@

nmap <silent> <BS> :nohlsearch<CR>

nmap <leader>b  <Plug>(coc-codeaction-selected)
nmap <leader>b  <Plug>(coc-codeaction-selected)
