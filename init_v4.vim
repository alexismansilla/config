set nocompatible
set nolist
set signcolumn=yes
set rnu
" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

syntax on

let mapleader = " "

filetype plugin indent on

set modelines=0
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
set textwidth=100
set colorcolumn=+1
set clipboard=unnamed " copy to system clipboard
set noswapfile
set mouse=nicr
" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase
" Better display for messages
set cmdheight=1
set nobackup
set nowritebackup

call plug#begin('~/.config/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'

  " Theme
  Plug 'morhetz/gruvbox'
  Plug 'crusoexia/vim-monokai'
  Plug 'dracula/vim', { 'as': 'dracula' }

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf', { 'do': { -> zf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'neoclide/coc.nvim' , { 'tag': '*', 'branch' : 'release' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'itchyny/vim-cursorword'
  Plug 'Yggdroot/indentLine'
  Plug 'digitaltoad/vim-pug'

  " Plug 'thoughtbot/vim-rspec'

  Plug 'leafoftree/vim-vue-plugin'
  Plug 'storyn26383/vim-vue'
call plug#end()

set termguicolors
" color dracula

colorscheme monokai

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
let g:NERDTreeIgnore = ['^node_modules$', 'bin', 'coverage', 'log', 'storage']
" ------------------------------------------|

" CtrlP (new mapping)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Buffer
nnoremap <silent> <C-h> :CtrlPBuffer<CR>
" map <Leader>ob :Buffer<cr>
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


" -RUBOCOP-----------------------------------------|
function! RubocopAutocorrect()
  execute "!rubocop -A " . bufname("%")
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>
" ------------------------------------------|
"
nmap <silent> <BS> :nohlsearch<CR>

autocmd! User FzfStatus

" statusline
"
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{fugitive#statusline()}\      
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

" syntastic

let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
command! -nargs=0 Format :call CocAction('format')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
  inoremap <silent><expr> <c-space> coc#refresh()

" Show all diagnostics
nnoremap <silent> <space>[  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>]  :<C-u>CocList outline<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd FileType scss setl iskeyword+=@-@

nmap <silent> <BS> :nohlsearch<CR>

"Rspec
map <Leader>tt :call RunCurrentSpecFile()<CR>

let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"

let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html', 'pug'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass'],
      \   'i18n': ['json', 'yaml']
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}
