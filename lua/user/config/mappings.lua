local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- still don't know how to exit vim
map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)
-- move the words along the visual select
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- navigating through buffers half wise
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- how to write and exit
map("n", "<leader>q", ":wq!<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>we", ":w<CR>:source %<CR>", opts)
-- tab navigations
map("n", "<TAB>", ":bnext<CR>", opts)
map("n", "<S-TAB>", ":bprevious<CR>", opts)
map("n", "<leader>b", ":bw<CR>", opts)
-- greatest remap ever as said by the primeagen
map("n", "<leader>p", '"_dP', opts)
map("v", "<", "<gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-b>", "<C-w>b", opts)
map("n", "<C-t>", "<C-w>t", opts)
map("n", "<C-w>", ":bd<CR>", opts)
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>th", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>tl", "<cmd>Telescope git_files<CR>", opts)
map("n", "<leader>tt", ":Lexplore<CR>", opts)
map("n", "<leader>o", ":lua vim.lsp.buf.format()<CR>", opts)
map("n", "<leader>u", "vim.cmd.UndoTreeToggle", opts)

local status_ok, mark = pcall(require, "harpoon.mark")
if not status_ok then
    return
end
local status_ok1, ui = pcall(require, "harpoon.ui")
if not status_ok1 then
    return
end

if status_ok and status_ok1 then
    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu)
    vim.keymap.set("n", "<M-1>", function()
        ui.nav_file(1)
    end)
    vim.keymap.set("n", "<M-2>", function()
        ui.nav_file(2)
    end)
    vim.keymap.set("n", "<M-3>", function()
        ui.nav_file(3)
    end)
    vim.keymap.set("n", "<M-4>", function()
        ui.nav_file(4)
    end)
end
