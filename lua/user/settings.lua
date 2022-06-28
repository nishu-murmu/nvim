vim.cmd([[
let g:mapleader = " "

set nocompatible
syntax enable
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set showcmd
set cmdheight=1
set scrolloff=10
set splitbelow
set splitright
set conceallevel=0
set title
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
set expandtab
set showtabline=2
set noshowmode
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus
set laststatus=0
set number
set relativenumber
set ruler
set cursorline
set hidden
set nowrap
set backspace=start,eol,indent
set mouse=a
set lazyredraw
set wildignore+=*/node_modules/*
set termguicolors
set guifont=NotoSans:h12
set background=dark
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
]])

vim.g.UtilSnipsExpandTrigger="<tab>"
vim.g.UtilSnipsJumpForwardTrigger="<C-b>"
vim.g.UtilSnipsJumpBackwardTrigger="<C-z>"
vim.g.find_files_findprg = "fd --hidden $* $d"
