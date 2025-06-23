local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
-- still don't know how to exit vim
map('i', 'jk', '<Esc>', opts)
map('i', 'kj', '<Esc>', opts)
-- move the words along the visual select
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- navigating through buffers half wise
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- how to write and exit
map('n', '<leader>q', ':wq!<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>we', ':w<CR>:source %<CR>', opts)
-- tab navigations
map('n', '<TAB>', ':bnext<CR>', opts)
map('n', '<S-TAB>', ':bprevious<CR>', opts)
map('n', '<leader>b', ':bw<CR>', opts)
-- greatest remap ever as said by the primeagen
map('n', '<leader>p', '"_dP', opts)
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map('n', '<leader>o', ':lua vim.lsp.buf.format()<CR>', opts)
map('n', '<leader>t', ':UndotreeToggle<CR>', opts)
map('n', '<M-n>', '<cmd>cnext<CR>', opts)
map('n', '<M-p>', '<cmd>cprev<CR>', opts)
