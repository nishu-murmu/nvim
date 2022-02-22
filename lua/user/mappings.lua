local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)
map("n", "<leader>q", ":wq!<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)
map("n", "<leader>b", ":bw<CR>", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>fl", "<cmd>Telescope git_files<CR>", opts)
map("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>tr", ":NvimTreeRefresh<CR>", opts)
map("n", "<leader>tn", ":NvimTreeFindFile<CR>", opts)
map("n", "<leader>gh", ":Lspsaga lsp_finder<CR>", opts)
map("n", "<leader>gr", ":Lspsaga rename<CR>", opts)
map("n", "<leader>gd", ":Lspsaga preview_definition<CR>", opts)
map("n", "<leader>t", ":Lspsaga open_floaterm<CR>", opts)
map("n", "<leader><A-d><C-n>", ":Lspsaga close_floaterm<CR>", opts)
vim.cmd([[
let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
      \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
      \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
      \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
      \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
      \ )})

call wilder#setup({'modes': [':', '/', '?']})
  
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ 'gradient': s:gradient
      \ },
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ 'border': 'rounded'
      \ }))
]])
