# My Neovim Config

This is my custom Neovim configuration for both Windows and Linux, focused on a lean setup with a small set of plugins that I actually use day to day.

## Installation and Setup

Just clone this repository into your Neovim configuration directory and run the `install_nvim.sh` script to install dependencies and set everything up.

## Features / Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) – Plugin manager powering this setup.
- [blink.cmp](https://github.com/Saghen/blink.cmp) – Fast completion engine (LSP, buffer, path, snippets).
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) – Large collection of ready‑to‑use snippets.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) – LSP client configuration for multiple languages.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – Treesitter‑based highlighting, folding and navigation.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) – Automatic insertion of matching pairs (brackets, quotes, etc.).
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) – Auto close/rename HTML & JSX tags using Treesitter.
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) – Smart, operator‑based commenting.
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) – Minimal UI for LSP status and progress.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) – Fuzzy finder for files, buffers, grep and more.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) – Lua utility library used by Telescope and other plugins.
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) – Git signs and hunk actions in the sign column.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) – Full‑featured Git integration.
- [oil.nvim](https://github.com/stevearc/oil.nvim) – File explorer replacing netrw, with a simple buffer‑like UI.
- [ThemeSwitch.nvim](https://github.com/nishu-murmu/ThemeSwitch.nvim) – Simple theme switcher for quickly toggling colorschemes.
- [undotree](https://github.com/mbbill/undotree) – Visual undo history browser.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) – Filetype icons used across the UI.
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) – Main colorscheme for this config.

## Key Mappings (Highlights)

Most keymaps are defined in `lua/user/config/mappings.lua`. Some of the ones I use most often:

- Insert mode: `jk` / `kj` to quickly leave insert mode.
- Window navigation: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` to move between splits.
- Buffers: `<Tab>` / `<S-Tab>` to cycle buffers, `<leader>b` to close the current buffer.
- Files & search (Telescope):
  - `<leader>f` – find files (respects `.gitignore`, shows hidden files).
  - `<leader>sg` – live grep in the current workspace.
  - `<leader>th` – search help tags.
  - `<leader>tl` – Git files.
- File explorer: `-` to open the parent directory with Oil.
- Undo history: `<leader>u` to toggle the undo tree.
- Formatting: `<leader>o` to format the current buffer via LSP.
- Basic workflow: `<leader>w` to write, `<leader>q` to save and quit.

### Inspirations

1. [ThePrimeagen](https://github.com/ThePrimeagen)
2. [jdhao](https://github.com/jdhao)
