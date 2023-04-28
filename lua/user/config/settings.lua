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
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
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
:hi CursorLine gui=underline
:hi CursorLine cterm=underline
:hi Cursor gui=underline
:hi Cursor cterm=underline
set hidden
set nowrap
set guifont=Hack\\Nerd\\Font:h17"
set backspace=start,eol,indent
set mouse=a
set lazyredraw
set wildignore+=*/node_modules/*
set termguicolors
" hi Pmenu ctermbg=10 ctermfg=0 guibg=#8080
set background=dark
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
]])
vim.opt.guicursor = ""
vim.g.UtilSnipsExpandTrigger = "<tab>"
vim.g.UtilSnipsJumpForwardTrigger = "<C-b>"
vim.g.UtilSnipsJumpBackwardTrigger = "<C-z>"
vim.g.find_files_findprg = "fd --hidden $* $d"
vim.g.find_files_findprg = "fd --hidden $* $d"
vim.g.loaded_node_provider = 0
