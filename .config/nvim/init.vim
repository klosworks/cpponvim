" .vimrc by Piotr Klos

" Set the leader key (the key for custom hotkeys) to comma (',') rather 
" than the default backslash ('\') as the comma is easier to consistently
" press.
let mapleader=","

" Below are folded sections of this file.
" The key combinations to navigate those are as follows:
" use zo to open the fold under cursor
" use zc to close the fold under cursor

" ----------------------- stuff for plugin installation and updates {{{

" needed by Vundle
set nocompatible
" needed by Vundle
filetype off 
" Let vim know that the terminal can display 256 colors. This is needed when
" using vim through a terminal multiplexer like screen or tmux, when the 
" XTERM variable has value like 'screen' and vim doesn't believe it can use 
" 256 colors. Without this, the background of status bar and vim-airline tabs
" would not display properly.
set t_Co=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required for Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins :
" for autocompletion, go-to-definition, error detection and so on
Plugin 'Valloric/YouCompleteMe'
" for buffer names at the top of the window
Plugin 'vim-airline/vim-airline'
" for heuristic file opening
" Plugin 'wincent/command-t'
" for displaying and navigating the source tree
Plugin 'scrooloose/nerdtree'
" for switching between header and source file in C++
Plugin 'derekwyatt/vim-fswitch'
" for saving sessions using (with tmux-resurrect or otherwise)
Plugin 'tpope/vim-obsession'
" For semantic highlighting for c++
Plugin 'arakashic/chromatica.nvim'
" Plugin 'jeaye/color_coded'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

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

" }}}

" ----------------------- vim-airline options {{{
let g:airline#extensions#tabline#enabled = 1
" }}}

" ----------------------- YouCompleteMe options {{{
nnoremap <F3> :YcmCompleter GoToImprecise<cr>
inoremap <F3> <c-o>:YcmCompleter GoToImprecise<cr>
highlight YcmErrorSection ctermbg=Red ctermfg=White
highlight YcmWarningSection ctermbg=Yellow ctermfg=Red
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" populate location list so that we can easily jump between errors
let g:ycm_always_populate_location_list = 1
let g:ycm_auto_trigger = 0
inoremap <leader>r <esc>:lnext<cr>a
nnoremap <leader>r :lnext<cr>

" }}}

" ----------------------- NERDTree options {{{
nmap <c-n> :NERDTreeToggle<CR>
" }}}

" ----------------------- vim-fswitch options {{{
" hotkey to source vimrc
nnoremap <leader>l :w<cr>:FSHere<cr>
inoremap <leader>l <esc>:w<cr>:FSHere<cr>
" }}}

" ----------------------- chromatica options {{{
let g:chromatica#enable_at_startup=1
let g:chromatica#libclang_path='/usr/lib/llvm-6.0/lib'
" }}}

