vim.cmd([[
let g:mapleader = " "

set nocompatible
syntax enable
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set list
set listchars=tab:>-,eol:↵
set incsearch ignorecase smartcase
set showcmd
set cmdheight=1
set scrolloff=10
set splitbelow
set splitright
set conceallevel=0
set title
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smarttab
set expandtab
set showtabline=2
set noshowmode
set nobackup
set nowritebackup
set nohlsearch
set updatetime=50
set timeoutlen=500
set clipboard=unnamedplus
set laststatus=0
set number
set relativenumber
set ruler
set cursorline
set hidden
set nowrap
set guifont=Hack\\Nerd\\Font:h17"
set backspace=start,eol,indent
set mouse=a
set lazyredraw
set wildignore+=*/node_modules/*
set termguicolors
set foldlevel=20
set foldmethod=expr
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
]])
vim.opt.guicursor = ''
vim.g.UtilSnipsExpandTrigger = '<tab>'
vim.g.UtilSnipsJumpForwardTrigger = '<C-b>'
vim.g.UtilSnipsJumpBackwardTrigger = '<C-z>'
vim.g.find_files_findprg = 'fd --hidden $* $d'
vim.g.find_files_findprg = 'fd --hidden $* $d'
vim.g.skip_ts_context_commentstring_module = true
vim.g.loaded_node_provider = 0
vim.g.python3_host_prog = '~/scoop/shims/python3.exe'
vim.g.undotree_DiffCommand = 'FC'
-- vim.o.foldcolumn = '1' -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.g.netrw_list_hide = ''
-- For translucent background
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
