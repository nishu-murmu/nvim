-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Install your plugins here
return lazy.setup({
    -- Plugin Manager here
    "nvim-lua/popup.nvim",                    -- implementation of popup API from vim to Neovim
    { "nvim-lua/plenary.nvim", lazy = true }, -- useful lua functions used by lot of plugins
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
    -- LSP
    "j-hui/fidget.nvim",     -- animations while lsp loading
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Completion plugins
    "hrsh7th/nvim-cmp",         -- The completion plugin
    "hrsh7th/cmp-buffer",       -- buffer completions
    "hrsh7th/cmp-path",         -- path completions
    "hrsh7th/cmp-cmdline",      -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",     -- nvim-cmp source for neovim's built-in language server client.
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta",  lazy = true }, -- optional `vim.uv` typings
    {
        -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "echasnovski/mini.icons" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    require("alpha").start()
                end,
            })
        end,
    },
    -- snippets
    "L3MON4D3/LuaSnip",
    -- Syntax/Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "kylechui/nvim-surround",
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Marks
    "ThePrimeagen/harpoon",
    --Colorschemes
    "navarasu/onedark.nvim",
    --Statusline and bufferline
    "akinsho/bufferline.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    -- Icons
    "kyazdani42/nvim-web-devicons", -- web icons
    -- Terminal
    "akinsho/toggleterm.nvim",      -- terminal below
    --Comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        config = function()
            require("Comment").setup()
        end,
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- Git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    --Editing support
    "windwp/nvim-autopairs",  -- pairs the brackets
    "windwp/nvim-ts-autotag", -- pairs the brackets for html tags (works tsx, html, vue, rescript, svelte, php)
    "mbbill/undotree",
    "gelguy/wilder.nvim",

    -- Peronal plugins
})
