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
au BufRead,BufNewFile *.m4 set filetype=c

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" Vimplug plugins
call plug#begin()

" Currently unused plugins...
" Plug 'vimwiki/vimwiki'

" Active plugins...
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()

" Themes
" colorscheme monokai
colorscheme gruvbox

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
