"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup

" NO FOLD ALLOWED
set nofoldenable

" Vundle Setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Ruby
Plugin 'vim-ruby/vim-ruby'

" Haskell
Plugin 'dag/vim2hs'

" Python
Plugin 'hdima/python-syntax'

" C
Plugin 'justinmk/vim-syntax-extra'

" Julia
Plugin 'JuliaLang/julia-vim'

" base16 colors
Plugin 'chriskempson/base16-vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Get rid of weird airline bug
set t_RV=

" EasyAlign
Plugin 'junegunn/vim-easy-align'

call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2 ruler hlsearch

" Set encoding.
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
endif

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Sets line numbers
set number

"Set terminal title to filename
set title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

"Always show current position
set ruler

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Solves :WQ problem
ca WQ wq
ca Wq wq
ca wQ wq
ca Q  q
ca W  w

" Usually annoys me
"set nowrap

" Usually I don't care about case when searching
set ignorecase

" Only ignore case when we type lower case when searching
set smartcase

"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>

"\s to toggle spell checking
nmap <silent> <leader>s :set spell! spelllang=pt_br<CR>

"\s to toggle spell checking
nmap <silent> <leader>e :set spell! spelllang=en<CR>

"F2 toggle pastemode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" NERDTree Mappings
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python options:
let python_highlight_all = 1

" Autoindent
set autoindent

" Set syntax ON
syntax on

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme base16-default-dark

" Airline config
let g:airline_theme='base16'

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'վ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'Π'
let g:airline_symbols.whitespace = 'Ξ'

set noshowmode

" Cursor Dont blink
set guicursor=

" Highlight current line
set cursorline
set synmaxcol=256

" Cleaner and lighter syntax highlights for .tex and .bib
"autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline
au FileType tex :set synmaxcol=128
"autocmd FileType bib :NoMatchParen
"au FileType bib setlocal nocursorline

" Highlight characters at the 80th collumn.
highlight ColorColumn ctermbg=246 ctermfg=white guibg=#592929
call matchadd('ColorColumn', '\%81v', 100)

" Reselect after indent so it can easily be repeated
 vnoremap < <gv
 vnoremap > >gv

" Indent Guide

" Automatically use indent guides
let g:indent_guides_enable_on_vim_startup=1
" Choose own guide colors
let g:indent_guides_auto_colors=0
" Guide width is 1 character column
let g:indent_guides_guide_size=1
" Explicit odd-numbered line color
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
" Explicit even-numbered line color
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
