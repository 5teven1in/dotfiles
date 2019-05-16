" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'townk/vim-autoclose'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" General Settings
set nocompatible    " not compatible with the old-fashion vi mode
set bs=2            " allow backspacing over everything in insert mode
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set autoread        " auto read when file is changed from outside
set hlsearch        " search highlighting
set autoindent      " auto indentation
set incsearch       " incremental search
set nobackup        " no *~ backup files
set copyindent      " copy the previous indentation on autoindenting
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to context
set nu
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins
syntax on

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting {
    set expandtab   " replace <TAB> with spaces
    set softtabstop=4
    set shiftwidth=4
    au FileType Makefile set noexpandtab
"}

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 

" go to previous tab
map <F11> gT
imap <F11> <C-o>gT

" go to next tab
map <F12> gt
imap <F12> <C-o>gt

" save and sudo save
map <C-t><C-s> :w !sudo tee > /dev/null %<CR>
imap <C-t><C-s> <C-o>:w !sudo tee > /dev/null %<CR>
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>

"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 

" --- UltiSnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/my-snippets/UltiSnips", $HOME."/.vim/plugged/vim-snippets/UltiSnips"]

" --- NerdTree Binding
nnoremap <silent> <F6> :NERDTree<CR>
inoremap <silent> <F6> <C-o>:NERDTree<CR>
