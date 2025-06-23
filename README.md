<div align="center">
   <h1 align="center" font="bolder">My Neovim Config</h1>
   <p>
 <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.10.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
</p>
<p>
    <a href="https://github.com/nishu-murmu/nvim/search?l=vim-script">
      <img src="https://img.shields.io/github/languages/top/nishu-murmu/nvim" alt="Top languages"/>
    </a>
    <a href="https://github.com/nishu-murmu/nvim/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/nishu-murmu/nvim?style=flat-square" />
    </a>
    <a>
      <img src="https://img.shields.io/github/repo-size/nishu-murmu/nvim?style=flat-square" />
    </a>
    <a href="https://github.com/nishu-murmu/nvim/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/nishu-murmu/nvim?style=flat-square&logo=GNU&label=License" alt="License"/>
    </a>
</p>
</div>


# Introduction
This is my custom neovim configuration, for platforms windows and linux.

# Installation and Setup
Just clone the repository and run the `install_script.sh` file

# Features
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words.
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - nvim-cmp source for Vim's command-line.
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for Neovim's built-in LSP.
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - nvim-cmp source for Neovim Lua API.
- [cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for filesystem paths.
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - nvim-cmp source for LuaSnip snippets.
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful commenting plugin for Neovim.
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - Standalone UI for LSP progress in Neovim.
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager for Neovim.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine for Neovim written in Lua.
- [neodev.nvim](https://github.com/folke/neodev.nvim) - Setup for Neovim Lua development.
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Inject LSP features via Lua in Neovim.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs plugin for Neovim written in Lua.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin for Neovim coded in Lua.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configs for Neovim LSP client.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations and abstraction layer.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto close and rename HTML tags using Treesitter.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons for Neovim Lua plugins.
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) - One Dark color scheme for Neovim.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Useful Lua functions for Neovim plugins.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Highly extendable fuzzy finder over lists.
- [undotree](https://github.com/mbbill/undotree) - Visualize Vim undo history as a tree.
- [vim-fugitive](https://github.com/tpope/vim-fugitive) - Git integration plugin for Vim.
- [wilder.nvim](https://github.com/gelguy/wilder.nvim) - Fuzzy command line autocompletion for Neovim.

# Mappings

Here is the documentation for your Neovim key mappings presented in MDX format:

---

### Neovim Key Mappings

| Mode | Key(s)        | Mapping/Command                   | Description                                      |
|------|---------------|-----------------------------------|--------------------------------------------------|
| `i`  | `jk`          | `<Esc>`                           | Exit insert mode using `jk`.                     |
| `i`  | `kj`          | `<Esc>`                           | Exit insert mode using `kj`.                     |
| `v`  | `J`           | `:m '>+1<CR>gv=gv`                | Move selected text down.                         |
| `v`  | `K`           | `:m '<-2<CR>gv=gv`                | Move selected text up.                           |
| `n`  | `n`           | `nzzzv`                           | Center cursor after searching forward.           |
| `n`  | `N`           | `Nzzzv`                           | Center cursor after searching backward.          |
| `n`  | `<C-d>`       | `<C-d>zz`                         | Half-page down and center cursor.                |
| `n`  | `<C-u>`       | `<C-u>zz`                         | Half-page up and center cursor.                  |
| `n`  | `<leader>q`   | `:wq!<CR>`                        | Save and quit file.                              |
| `n`  | `<leader>w`   | `:w<CR>`                          | Save current file.                               |
| `n`  | `<leader>we`  | `:w<CR>:source %<CR>`             | Save and source current file.                    |
| `n`  | `<Tab>`       | `:bnext<CR>`                      | Go to next buffer.                               |
| `n`  | `<S-Tab>`     | `:bprevious<CR>`                  | Go to previous buffer.                           |
| `n`  | `<leader>b`   | `:bw<CR>`                         | Close current buffer.                            |
| `n`  | `<leader>p`   | `"_dP`                            | Paste over without yanking.                      |
| `v`  | `<`           | `<gv`                             | Indent left and reselect text.                   |
| `v`  | `>`           | `>gv`                             | Indent right and reselect text.                  |
| `n`  | `<C-h>`       | `<C-w>h`                          | Move to left window.                             |
| `n`  | `<C-j>`       | `<C-w>j`                          | Move to window below.                            |
| `n`  | `<C-k>`       | `<C-w>k`                          | Move to window above.                            |
| `n`  | `<C-l>`       | `<C-w>l`                          | Move to right window.                            |
| `n`  | `<C-b>`       | `<C-w>b`                          | Move to bottom window.                           |
| `n`  | `<C-t>`       | `<C-w>t`                          | Move to top window.                              |
| `n`  | `<leader>f`   | `<cmd>Telescope find_files<CR>`   | Find files using Telescope.                      |
| `n`  | `<leader>sg`  | `<cmd>Telescope live_grep<CR>`    | Live grep with Telescope.                        |
| `n`  | `<leader>b`   | `<cmd>Telescope buffers<CR>`      | List buffers with Telescope.                     |
| `n`  | `<leader>th`  | `<cmd>Telescope help_tags<CR>`    | Search help tags with Telescope.                 |
| `n`  | `<leader>tl`  | `<cmd>Telescope git_files<CR>`    | Find Git files with Telescope.                   |
| `n`  | `<leader>tt`  | `:Lexplore<CR>`                   | Toggle file explorer.                            |
| `n`  | `<leader>o`   | `:lua vim.lsp.buf.format()<CR>`   | Format code using LSP.                           |
| `n`  | `<leader>u`   | `:UndotreeToggle<CR>`             | Toggle the undo tree panel.                      |

---

**Notes:**

- `<leader>` is a placeholder for your leader key, which is usually set to `\` or `,` by default.
- The mappings for `<leader>b` are assigned twice:
  - `:bw<CR>` to close the current buffer.
  - `<cmd>Telescope buffers<CR>` to list buffers with Telescope.
- Adjust one of the `<leader>b` mappings to prevent conflicts.

---

**Descriptions:**

- **Exit Insert Mode Quickly:** Use `jk` or `kj` in insert mode to exit to normal mode without reaching for the `<Esc>` key.
- **Move Selected Text:** In visual mode, `J` moves the selected block down, and `K` moves it up, allowing quick text rearrangement.
- **Center Cursor After Search:** After using `n` or `N` to navigate search results, the cursor will center in the window for better visibility.
- **Smooth Scrolling:** `<C-d>` and `<C-u>` scroll half a page down or up and center the cursor to maintain context.
- **Window Navigation:** Use `<C-h>`, `<C-j>`, `<C-k>`, and `<C-l>` to navigate between split windows efficiently.
- **Buffer Management:** Navigate buffers using `<Tab>` and `<S-Tab>`, close buffers with `<leader>b`, and list buffers with Telescope.
- **Indentation in Visual Mode:** `<` and `>` indent selected text and keep it selected for further indentation if needed.
- **File Operations:** Save files with `<leader>w`, save and quit with `<leader>q`, and save and source with `<leader>we`.
- **Telescope Integrations:** Quickly access file searching, live grep, buffers, and help tags using Telescope commands.
- **Formatting and Undo Tree:** Format code with `<leader>o` and toggle the undo tree visualization with `<leader>u`.

---

Feel free to adjust the mappings or descriptions according to your specific configuration or preferences.


# Screenshots

## Lazy.nvim
![WindowsTerminal_NVbxy37idi](https://github.com/user-attachments/assets/b23e1394-ff59-4eb4-9b94-fb8394fe1af4)
## Telescope
![WindowsTerminal_hiSVWQlvc3](https://github.com/user-attachments/assets/5f5c5404-af54-44c6-a51a-a7af7a9faa9d)
## Fugitive
![WindowsTerminal_O1iyb1JZlZ](https://github.com/user-attachments/assets/1d7acd82-fd45-404a-8236-bc6d77f0c214)
## Playground
![WindowsTerminal_KjWzrIuAAO](https://github.com/user-attachments/assets/e7a83175-bf3d-4663-9968-dd0f4ec3c5b9)


### Inspirations
1. [ThePrimeagen](https://github.com/ThePrimeagen)
2. [jdhao](https://github.com/jdhao)
