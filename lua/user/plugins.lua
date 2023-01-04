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
	-- Completion plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in language server client.
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("zbirenbaum/copilot-cmp")
	use({ "tzachar/cmp-tabnine", run = "./install.sh" })

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("SirVer/ultisnips")
	use("norcalli/snippets.nvim")
	use("hrsh7th/vim-vsnip")

	-- Syntax/Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
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
	use("christianchiarulli/harpoon")

	-- Color
	use("NvChad/nvim-colorizer.lua")
	use("ziontee113/color-picker.nvim")

	--Colorschemes
	use("navarasu/onedark.nvim") -- colorscheme

	--Utility
	use("rcarriga/nvim-notify")
	use("stevearc/dressing.nvim")
	use("ghillb/cybu.nvim")
	use("moll/vim-bbye")
	use("lewis6991/impatient.nvim")
	use("lalitmee/browse.nvim")

	--Statusline and bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Registers
	use("tversteeg/registers.nvim")

	-- Icons
	use("kyazdani42/nvim-web-devicons") -- web icons

	-- Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

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
	use("windwp/nvim-spectre")

	-- Session
	--use {"rmagatti/auto-session", branch="dir-changed-fixes"}
	--use "rmagatti/session-lens"

	-- Quickfix
	use("kevinhwang91/nvim-bqf")

	-- Code Runner
	use("is0n/jaq-nvim")
	use({
		"0x100101/lab.nvim",
		run = "cd js && npm ci",
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("ruifm/gitlinker.nvim")
	use("mattn/vim-gist")
	use("mattn/webapi-vim")

	-- Github
	use("pwntester/octo.nvim")
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
	use("monaqa/dial.nvim")
	use("nacro90/numb.nvim")
	use("andymass/vim-matchup")
	use("folke/zen-mode.nvim")
	use("karb94/neoscroll.nvim")
	use("m4xshen/autoclose.nvim")
	use("ekickx/clipboard-image.nvim")
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

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
