let $VIM='~/.vim/'
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set number
set cursorline
set timeout
set timeoutlen=1000
set ttimeoutlen=100
"set hidden
filetype plugin on
colorscheme molokai
set background=dark
set textwidth=79
filetype off
"execute pathogen#infect()
filetype plugin indent on
syntax on
set wildmenu
set pastetoggle=<F2>
set splitright

let $PATH = $PATH . ':' . expand('/home/bolt/.cabal/bin')

" Startify settings
let g:startify_bookmarks = ['~/.vimrc', '~/.gvimrc','~/.bash_aliases']
let g:startify_files_number = 5
let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" This points out leading whitespace
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" See diff
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Starting NERDTree if no file spcified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree

" Keyboard shortcuts
map <C-c> :NERDTreeToggle<CR>
"map <C-x> :NERDTreeClose<CR>
nmap <leader>q :SyntasticCheck<CR>
nmap <leader>; :SyntasticReset<CR>

nmap <leader>. :rightbelow vnew<CR>
nmap <leader>, :rightbelow new<CR>
nmap <leader>' :EasyBuffer<CR>

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
"Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim'
Plug 'Raimondi/delimitMate'
"Plug 'eagletmt/ghcmod-vim'
Plug 'kien/ctrlp.vim'
Plug 'rust-lang/rust.vim'
"Plug 'vim-latex/vim-latex'
call plug#end()

" Syntastic config
"let g:syntastic_mode_map = { "mode": "active",
                           "\ "active_filetypes": [],
                           "\ "passive_filetypes": ["scala", "haskell"] }
"let g:syntastic_enable_racket_racket_checker = 1
