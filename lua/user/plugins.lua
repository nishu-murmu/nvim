local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' 
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim" 
  use "windwp/nvim-autopairs" -- pairs the brackets
  use "numToStr/Comment.nvim"
  use "L3MON4D3/LuaSnip" 
  use "rafamadriz/friendly-snippets" 
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use 'TimUntersberger/neogit'
  use 'pwntester/octo.nvim'
  use 'ekickx/clipboard-image.nvim'
  use 'williamboman/nvim-lsp-installer'
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use 'sbdchd/neoformat'
  use 'ggandor/lightspeed.nvim'
  use 'rcarriga/nvim-notify'
  use 'luukvbaal/stabilize.nvim'
  use 'gennaro-tedesco/nvim-peekup'
  use 'nyngwang/NeoRoot.lua'
  use 'norcalli/snippets.nvim'
  use 'hrsh7th/vim-vsnip'
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use "tamago324/nlsp-settings.nvim"
  use 'lewis6991/spellsitter.nvim'
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
  }
  use 'SirVer/ultisnips'
  use 'karb94/neoscroll.nvim'
  use 'norcalli/nvim-colorizer.lua' -- marking colors
  use "neovim/nvim-lspconfig" -- enable LSP
  use 'glepnir/lspsaga.nvim' -- lsp saga
  use "nvim-telescope/telescope.nvim" -- fuzzy finder
  use "lewis6991/gitsigns.nvim" -- 
  use "kyazdani42/nvim-web-devicons" -- web icons
  use "akinsho/bufferline.nvim" -- bufferline
  use {"akinsho/toggleterm.nvim"} -- terminal below
  use 'navarasu/onedark.nvim' -- colorscheme
  use 'goolord/alpha-nvim'
  use {
      'kyazdani42/nvim-tree.lua',
       commit = '3f4ed9b6c2598ab8304186486a05ae7a328b8d49'
  }
  use "folke/which-key.nvim" -- commands helper
  use 'gelguy/wilder.nvim'
  use 'roxma/nvim-yarp'
  use 'roxma/vim-hug-neovim-rpc'
  use  "aserowy/tmux.nvim"
  use 'kdheepak/lazygit.nvim'
  use '~/Documents/cyanide.nvim/'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
