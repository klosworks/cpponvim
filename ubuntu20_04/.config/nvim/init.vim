
let mapleader=","

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'jackguo380/vim-lsp-cxx-highlight'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ----------------------- normal vim options {{{

" always display the gutter to the left of the code. This prevents
" disorientation due to the unexpected horizontal shift that sometimes 
" happens when gutter appears on demand
set signcolumn=yes
" display line numbers
set number
" set tab to 4 spaces
set shiftwidth=4
" set tab to 4 spaces (in some more actions)
set tabstop=4
" replace tabs with spaces during editing
set expandtab
" automatically indent on Enter
set autoindent
" 
set ttimeoutlen=100
" remove hotkeys that begin with ESC. This removes a small delay that 
" could otherwise disorient you everytime you hit ESC to quit insert mode
" set noesckeys
" highlight all occurences of the searched pattern
set hlsearch

" hotkey to source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" hotkey to open vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" hotkey to clear the search
nnoremap <leader>m /fkdlsfkdlsajfkdlsajfdksVCXZVXZMCVXZM<cr>

" save with ctrl-s
nnoremap <c-s> :w<cr>
"     Note that we don't go back to insert mode after save. This is more useful in
"     practice, as we usually only save when we finish writing some small
"     piece of code, so at that point we want to navigate to another spot, rather than keep
"     writing. If you are used to the more popular workflow, add 'a' at the end of the following 
"     line.
inoremap <c-s> <c-o>:w<CR>
vnoremap <C-s> <esc>:w<CR>gv

" change to normal mode by presssing jk or kj
inoremap jk <esc>
inoremap kj <esc>

" enable folding for vim files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


nnoremap <leader>n :bn<cr>
inoremap <leader>n <esc>:bn<cr>a

nnoremap <leader>p :bp<cr>
inoremap <leader>p <esc>:bp<cr>a

nnoremap <leader>e :bp<cr>:bd #<cr>

" Limit the max count of the popup list display (such as in auto-completion)
" so that the popups only cover a small portion of the screen. This 
" limits the visual noise and disorientation.
set pumheight=8

" Allow basic pane navigation using the <leader> key
" This is useful on some systems (such as WSL) where <c-w> doesn't work in
" insert mode. For normal Ubuntu you can remove the following 8 lines.
nnoremap <leader>wj <c-w>j 
nnoremap <leader>wk <c-w>k 
nnoremap <leader>wh <c-w>h 
nnoremap <leader>wl <c-w>l 

inoremap <leader>wj <esc>:winc j<cr>
inoremap <leader>wk <esc>:winc k<cr>
inoremap <leader>wh <esc>:winc h<cr>
inoremap <leader>wl <esc>:winc l<cr>

set noswapfile

" }}}

" ----------------------- vim-airline options {{{
let g:airline#extensions#tabline#enabled = 1
" }}}

" ----------------------- NERDTree options {{{
nmap <c-n> :NERDTreeToggle<CR>
" }}}

" ----------------------- vim-fswitch options {{{
" hotkey to source vimrc
nnoremap <leader>l :w<cr>:FSHere<cr>
inoremap <leader>l <esc>:w<cr>:FSHere<cr>
" }}}

" ----------------------- vim-lsp-cxx-highlight options {{{
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"  }}}

" ----------------------- coc.nvim options {{{
nmap <F3> <Plug>(coc-definition)
"  }}}

