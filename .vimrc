set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" add all plugins here ...
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
Plugin 'tell-k/vim-autopep8'
Plugin 'python-mode/python-mode'
Plugin 'neomake/neomake'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'lervag/vimtex'

" colorschemes
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'morhetz/gruvbox'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" autocomplete

let python_highlight_all=1
syntax enable
if has("gui_running")
    colorscheme cobalt2
    set guifont=Hack\ 13
else
    colorscheme wombat256
endif

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" autocmd vimenter * NERDTree
set nu


" Set to auto read when a file is changed from the outside
set autoread

" Define local leader
let maplocalleader = "-"

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"fast tab switching
nmap <leader>n :tabn<cr>
nmap <leader>j :tabp<cr>

" Fast saving
nmap <leader>w :w!<cr>
" fast quit
nmap <leader>q :wqa<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Autoformatting
nmap <leader>f :Autopep8<cr>

" set vimtex pdf viewer
let g:vimtex_view_general_viewer = 'zathura'

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 



set ruler
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" activate wildmenu
set wildmenu

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

nnoremap <leader>r <C-w>=

map <space> /
map <c-space> ?


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

try
catch
endtry
