set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'		   " plugin manager
Plugin 'tmhedberg/SimpylFold'		   " allow code collapsing
Plugin 'vim-scripts/indentpython.vim'	   " autoindent
Plugin 'godlygeek/tabular'		   " align code nicely
Plugin 'scrooloose/nerdcommenter'	   " easily comment code in blocks
Plugin 'kien/ctrlp.vim'          	   " search file from within vim
"Plugin 'vim-syntastic/syntastic'	   " linter
Plugin 'w0rp/ale'			   " linter
Plugin 'scrooloose/nerdtree'     	   " file tree
Plugin 'jistr/vim-nerdtree-tabs' 	   " file tree
Plugin 'altercation/vim-colors-solarized'  " solarized color scheme
"Plugin 'crusoexia/vim-monokai'		   " sublime color scheme
Plugin 'vim-airline/vim-airline' 	   " status bar
Plugin 'vim-airline/vim-airline-themes'    " status bar themes
Plugin 'tpope/vim-fugitive'      	   " enable basic git commands within vim
Plugin 'airblade/vim-gitgutter'		   " show + and - git
Plugin 'tpope/vim-surround'		   " close brackets
"Plugin 'jiangmiao/auto-pairs'		   " close brackets
"Plugin 'christoomey/vim-tmux-navigator'	  
"Plugin 'mattn/emmet-vim'		
"Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" UTF-8 Support
set encoding=utf-8

" remove insert->normal mode delay
set ttimeoutlen=50

" Make python look pretty
let python_highlight_all=1

" vim color scheme!
syntax on
colorscheme solarized

" NerdTree  Ignore .pyc files on nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Enable folding
set foldmethod=indent
set foldlevel=99

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Automatic toggling between relative and absolute numbering
set number relativenumber
set nu rnu
augroup numbertoggle
       autocmd!
       autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
       autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 | 		" standard four spaces with tab
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    "\ set textwidth=79 | 	" ensure line length <=79 characters NOT WORKING
    "\ set colorcolumn=79 |	" line ruler at specified text width NOT WORKING
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix | 	" store in Unix format to prevent github conversion issues
    "\ set completeopt=menu,menuone,preview,noinsert " parameter autocompletion NOT WORKING

" PEP8 line length ruler
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" PEP8 whitespace issues
highlight BadWhitespace ctermbg=darkgreen guibg=lightgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 	" trailing whitespace bad
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/ 		" beginning tab bad

" PEP8 ALE
let g:ale_linters = {'python': ['flake8','pyflakes','pylint']}
let g:ale_fixers = {'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace']}
" navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap) 	" ctrl+k
nmap <silent> <C-j> <Plug>(ale_next_wrap)	" ctrl+j

" Airline
set noshowmode 			   " remove --INSERT-- text under statusline
let g:airline_theme='simple'	   "set theme
let g:airline_powerline_fonts = 1  " enable/install airline powerline fonts    
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
