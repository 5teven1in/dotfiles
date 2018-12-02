" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'townk/vim-autoclose'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" set ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips", "~/.vim/my-snippets/UltiSnips"]

" tab = 4 space
set tabstop=4
set shiftwidth=4
set expandtab

set nu
