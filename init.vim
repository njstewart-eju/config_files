" General Options
set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set mouse=nv
set tabstop=4
set autoindent

" Vimplug
call plug#begin()

" Plug 'vimwiki/vimwiki'

" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'crusoexia/vim-monokai'

Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()

" Themes
colorscheme monokai

" VimTeX
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let maplocalleader = ","

" Vimwiki
"let g:vimwiki_list = [{'path': '~/Documents/github/njs-notes/', 'syntax': 'markdown', 'ext': 'md'}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_markdown_link_ext = 1
