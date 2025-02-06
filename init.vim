set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set mouse=nv
set tabstop=4
set autoindent

call plug#begin()

Plug 'vimwiki/vimwiki'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'crusoexia/vim-monokai'

call plug#end()

colorscheme monokai

let g:vimwiki_list = [{'path': '~/Documents/github/njs-notes/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
