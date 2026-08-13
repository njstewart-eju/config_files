-- global options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.autoindent = false
vim.opt.showmode = false
vim.opt.showcmd = false

-- TO DO!
-- For .e (EPIC) files to show with C syntax
--au BufRead,BufNewFile *.e set filetype=c
--au BufRead,BufNewFile *.m4 set filetype=c

-- keybinds
-- terminal mode use escape to exit
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- load Oil for current directory with -
vim.keymap.set('n', '-', '<CMD>Oil<CR>')
-- FZF with F or grep with G
vim.keymap.set('n', '<Space>f', ":lua require('fzf-lua').files()<CR>")
vim.keymap.set('n', '<Space>g', ":lua require('fzf-lua').grep()<CR>")

-- vim-plug
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- plugins (no () needed if only one argument)
Plug 'ellisonleao/gruvbox.nvim' -- colorscheme
Plug 'nvim-lualine/lualine.nvim' -- statusline
Plug 'nvim-tree/nvim-web-devicons' -- devicons for lualine, oil etc.
Plug 'lervag/vimtex' -- compile tex
Plug 'stevearc/oil.nvim' -- working with files
Plug 'ibhagwan/fzf-lua' -- fuzzy finder and grep
vim.call('plug#end')

-- lualine settings
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- oil.nvim settings
require("oil").setup()

-- fzf-lua settings
require("fzf-lua").setup()

-- vimtex settings
vim.cmd([[let g:vimtex_view_method = 'zathura']])
vim.cmd([[let maplocalleader = ","]])

-- gruvbox settings
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
