local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
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
      return require("packer.util").float({ border = "single" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Manager here
  use("wbthomason/packer.nvim") -- Packer manage itself
  use("nvim-lua/popup.nvim")    -- implementation of popup API from vim to Neovim
  use("nvim-lua/plenary.nvim")  -- useful lua functions used by lot of plugins

  -- LSP
  use { "j-hui/fidget.nvim", tag = 'legacy' } -- animations while lsp loading
  use("neovim/nvim-lspconfig")                -- enable LSP
  use({ "williamboman/mason.nvim" })
  use("williamboman/mason-lspconfig.nvim")
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  -- Completion plugins
  use("hrsh7th/nvim-cmp")         -- The completion plugin
  use("hrsh7th/cmp-buffer")       -- buffer completions
  use("hrsh7th/cmp-path")         -- path completions
  use("hrsh7th/cmp-cmdline")      -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")     -- nvim-cmp source for neovim's built-in language server client.
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-nvim-lua")
  use("folke/neodev.nvim")
  -- snippets
  use("L3MON4D3/LuaSnip")

  -- Syntax/Treesitter
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/playground")
  use("kylechui/nvim-surround")

  -- Telescope
  use("nvim-telescope/telescope.nvim") -- fuzzy finder
  use("nvim-telescope/telescope-media-files.nvim")
  use("tom-anders/telescope-vim-bookmarks.nvim")

  -- Marks
  use("ThePrimeagen/harpoon")

  --Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })

  --Statusline and bufferline
  use({ "akinsho/bufferline.nvim" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Icons
  use("kyazdani42/nvim-web-devicons") -- web icons

  -- Terminal
  use({ "akinsho/toggleterm.nvim" }) -- terminal below

  --Comments
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("kdheepak/lazygit.nvim")
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")

  --Editing support
  use("windwp/nvim-autopairs")  -- pairs the brackets
  use("windwp/nvim-ts-autotag") -- pairs the brackets for html tags (works tsx, html, vue, rescript, svelte, php)
  use({ "stevearc/dressing.nvim" })
  use("mbbill/undotree")
  use("gelguy/wilder.nvim")

  -- Peronal plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
