local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

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
