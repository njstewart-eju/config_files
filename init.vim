" General vim options
set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set mouse=nv
set tabstop=4
set autoindent
" For .e (EPIC) files to show with C syntax
au BufRead,BufNewFile *.e set filetype=c

" Vimplug plugins
call plug#begin()

" Currently unused plugins...
" Plug 'vimwiki/vimwiki'

" Active plugins...
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()

" Themes
colorscheme monokai

" Vim-Airline settings
let g:airline_theme='minimalist'

" VimTeX settings
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let maplocalleader = ","

" Vimwiki
"let g:vimwiki_list = [{'path': '~/Documents/github/njs-notes/', 'syntax': 'markdown', 'ext': 'md'}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_markdown_link_ext = 1
