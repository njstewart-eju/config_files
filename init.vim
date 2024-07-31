set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set mouse=nv
set tabstop=4
set autoindent
colorscheme torte

call plug#begin()

Plug 'vimwiki/vimwiki'

call plug#end()

let g:vimwiki_list = [{'path': '~/Documents/github/njs-notes/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
