<h2 align="center">My nvim config in lua</h2>

#### ⚠️ _NOTE:_
<a>This config purely is for my own use. There are already great preconfigured configs out there. I'm still learning about this.</a>

<a id="fea"></a>
## :sparkles: Features
1. Built-in Native [LSP](https://neovim.io/doc/user/lsp.html)
    * Go-to-defintion
    * lsp-finder
    * Renaming
    * Line diagnostics
    * Hover
    * floating terminal
2. Auto Completion - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
3. Fuzzy Finder - [Telescope](https://github.com/nvim-telescope/telescope.nvim)
4. File Explorer - [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
5. Git Integration - [LazyGit](https://github.com/kdheepak/lazygit.nvim)
6. Ternminal Integration - [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
7. Quick word/letter jump - [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
8. Keybinding helper - [Whichkey](https://github.com/folke/which-key.nvim)
9. Fancy startup - [alpha](https://github.com/goolord/alpha-nvim)

<a id="install"></a>
## :hammer_and_wrench: Installation
### Prerequisites
  * Neovim [0.7+]() or [Nightly](https://neovim.io/)
  * [Nodejs/npm](https://nodejs.org/)
  * Python [3.9+](https://www.python.org/)
  * [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (I prefer Hack Mono)

### Install for Linux
1. Clone this repository
    ```
    git clone https://github.com/nishu-murmu/TezVim.git ~/.config/nvim
    ```
2. Install [Packer](https://github.com/wbthomason/packer.nvim)
    ```
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\ 
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```
3. Open Neovim and run
    ```
    :PackerInstall
    ```
### Install for Windows
1. Clone this repository
    ```
    git clone https://github.com/nishu-murmu/TezVim.git ~/.config/nvim
    ```
2. Install [Packer](https://github.com/wbthomason/packer.nvim)
   ```
   git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
   ```
<a id="credits"></a>
## :label: References
1. [Christian Chiarulli](https://github.com/ChristianChiarulli)
