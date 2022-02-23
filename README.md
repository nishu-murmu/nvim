<img src="https://github.com/nishu-murmu/TezVim/blob/main/assets/Tezvim-logo/Tezvim-logos_transparent.png"/> 
<h4 align="center">
 <a href="#fea">:sparkles: Features</a> 🔸
 <a href="#install">:hammer_and_wrench: Installation</a> 🔸
 <a href="#camera">:camera: Screenshots</a> 🔸
 <a href="#todo">:scroll: TODO</a>
</h4>
<div align="center">
 <img alt="GitHub" src="https://img.shields.io/github/license/nishu-murmu/Tez.nvim">
 <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/nishu-murmu/Tez.nvim">
 <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/nishu-murmu/Tez.nvim">
 <img alt="Twitter" src="https://img.shields.io/twitter/url?url=https%3A%2F%2Ftwitter.com%2F_Gliches_" />
</div>

#### ⚠️ _NOTE:_
<a>This config purely is for my own use. There are already great preconfigured configs out there. I'm still learning about this.</a>

<a id="fea"></a>
## :sparkles: Features
1. Built-in Native [LSP]()
    * Go-to-defintion
    * lsp-finder
    * Renaming
    * Line diagnostics
    * Hover
    * floating terminal
2. Auto Completion - [nvim-cmp]()
3. Fuzzy Finder - [Telescope]()
4. File Explorer - [NvimTree]()
5. Git Integration - [LazyGit]()
6. Ternminal Integration - [Toggleterm]()
7. Quick word/letter jump - [Lightspeed]()
8. Keybinding helper - [Whichkey]()
9. Fancy startup - [alpha]()

<a id="install"></a>
## :hammer_and_wrench: Installation
### Prerequisites
  * Neovim [0.5+]() or [Nightly]()
  * [Nodejs/npm]()
  * Python [3.9+]()
  * [Nerd Fonts]() (I prefer Hack Mono)

### Install for Linux
1. Clone this repository
    ```
    git clone https://github.com/nishu-murmu/TezVim.git ~/.config/nvim
    ```
2. Install [Packer]()
    ```
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```
3. Open Neovim and run
    ```
    :PackerInstall
    ```
    
<a id="camera"></a>
## :camera: ScreenShots

### Startup
![](https://github.com/nishu-murmu/TezVim/blob/main/assets/start-up.png)

### Auto Completion
![](https://github.com/nishu-murmu/TezVim/blob/main/assets/completion.png)

### LSP
#### LSP finder
![](https://github.com/nishu-murmu/TezVim/blob/main/assets/lsp-finder.png)

#### LSP rename
![LSP rename](https://github.com/nishu-murmu/TezVim/blob/main/assets/rename.png)

#### LSP diagnostics
![](https://github.com/nishu-murmu/TezVim/blob/main/assets/lsp-diagnostics.png)

### Fuzzy Finder
![Telescope](https://github.com/nishu-murmu/TezVim/blob/main/assets/finder.png)

### File Explorer
![NvimTree](https://github.com/nishu-murmu/TezVim/blob/main/assets/file-explorer.png)

### Git
![LazyGit](https://github.com/nishu-murmu/TezVim/blob/main/assets/lazygit.png)

### Terminal integration
![Toggleterm](https://github.com/nishu-murmu/TezVim/blob/main/assets/terminal.png)

### Which Key
![whichkey](https://github.com/nishu-murmu/TezVim/blob/main/assets/whichkey.png)

<a id="todo"></a>
## :scroll: TODO
 - [x] Logo
 - [ ] Add windows platform installation
 - [ ] Better docs and wiki
 - [ ] Have my first release

<a id="credits"></a>
## :label: References
1. [Christian Chiarulli]()
