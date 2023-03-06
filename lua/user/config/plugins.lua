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
    -- My plugins here
    use("wbthomason/packer.nvim") -- Packer manage itself
    use("nvim-lua/popup.nvim") -- implementation of popup API from vim to Neovim
    use("nvim-lua/plenary.nvim") -- useful lua functions used by lot of plugins

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use({ "williamboman/mason.nvim" })
    use("williamboman/mason-lspconfig.nvim")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("j-hui/fidget.nvim")
    -- Completion plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in language server client.
    use("hrsh7th/cmp-emoji")
    use("hrsh7th/cmp-nvim-lua")
    use("folke/neodev.nvim")
    use("github/copilot.vim")

    -- snippets
    use("L3MON4D3/LuaSnip")

    -- Syntax/Treesitter
    use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")
    use("windwp/nvim-ts-autotag")
    use("kylechui/nvim-surround")
    use({
        "abecodes/tabout.nvim",
        wants = { "nvim-treesitter" }, -- or require if not used so far
    })

    -- Telescope
    use("nvim-telescope/telescope.nvim") -- fuzzy finder
    use("nvim-telescope/telescope-media-files.nvim")
    use("tom-anders/telescope-vim-bookmarks.nvim")

    -- Marks
    use("ThePrimeagen/harpoon")

    -- CursorLine
    use("yamatsum/nvim-cursorline")
    -- Color
    use("NvChad/nvim-colorizer.lua")
    use("ziontee113/color-picker.nvim")

    --Colorschemes
    use("navarasu/onedark.nvim") -- colorscheme
    use({ "ellisonleao/gruvbox.nvim" })
    use("EdenEast/nightfox.nvim")
    use("kaicataldo/material.vim")
    use({ "catppuccin/nvim", as = "catppuccin" })

    --Utility
    use("rcarriga/nvim-notify")

    --Statusline and bufferline
    use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Icons
    use("kyazdani42/nvim-web-devicons") -- web icons

    -- Startup
    use("goolord/alpha-nvim")

    -- File Explorer
    use("kyazdani42/nvim-tree.lua")

    -- Indent
    use("lukas-reineke/indent-blankline.nvim")

    -- Terminal
    use({ "akinsho/toggleterm.nvim" }) -- terminal below

    --Comments
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Project
    use("ahmedkhalf/project.nvim")

    -- Quickfix
    use("kevinhwang91/nvim-bqf")

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("f-person/git-blame.nvim")
    use("ruifm/gitlinker.nvim")
    use("mattn/vim-gist")
    use("mattn/webapi-vim")

    --motion
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
    })

    --Keybindings
    use("folke/which-key.nvim")

    --Editing support
    use("windwp/nvim-autopairs") -- pairs the brackets
    use("mbbill/undotree")
    use("TimUntersberger/neogit")
    use("nacro90/numb.nvim")
    use("andymass/vim-matchup")
    use("folke/zen-mode.nvim")
    use("karb94/neoscroll.nvim")
    use("m4xshen/autoclose.nvim")
    use("ekickx/clipboard-image.nvim")
    use({
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup({})
        end,
    })
    use("nyngwang/NeoRoot.lua")
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
        },
    })
    use({
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
    })
    use("gelguy/wilder.nvim")

    -- Peronal plugins
    -- use("~/Documents/luaPlugin.nvim/")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
