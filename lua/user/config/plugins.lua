-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Install your plugins here
return lazy.setup({
    { import = "user.plugins" },
    { import = "user.lsp" },
    -- "j-hui/fidget.nvim",     -- animations while lsp loading
    -- "neovim/nvim-lspconfig", -- enable LSP
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },
    -- Completion plugins
    -- {
    --     "hrsh7th/nvim-cmp",
    --     opts = function(_, opts)
    --         opts.sources = opts.sources or {}
    --         table.insert(opts.sources, {
    --             name = "lazydev",
    --             group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --         })
    --     end,
    --     dependencies = {
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-nvim-lsp"
    --     }
    -- },                          -- The completion plugin
    -- buffer completions
    -- "hrsh7th/cmp-path",         -- path completions
    -- "hrsh7th/cmp-cmdline",      -- cmdline completions
    -- "saadparwaiz1/cmp_luasnip", -- snippet completions
    -- "hrsh7th/cmp-nvim-lua",
    -- {
    --     "folke/lazydev.nvim",
    --     ft = "lua", -- only load on lua files
    --     opts = {
    --         library = {
    --             -- See the configuration section for more details
    --             -- Load luvit types when the `vim.uv` word is found
    --             { path = "luvit-meta/library", words = { "vim%.uv" } },
    --         },
    --     },
    -- },
    -- {
    --     "L3MON4D3/LuaSnip",
    --     -- follow latest release.
    --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --     -- install jsregexp (optional!).
    --     build = "make install_jsregexp",
    -- },
    -- -- Syntax/Treesitter
    -- "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/playground",
    -- "kylechui/nvim-surround",
    -- -- Telescope
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     tag = "0.1.8",
    --     -- or                              , branch = '0.1.x',
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },
    -- -- Marks
    -- "ThePrimeagen/harpoon",
    -- --Colorschemes
    -- "navarasu/onedark.nvim",
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- --Statusline and bufferline
    -- "akinsho/bufferline.nvim",
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    -- },
    -- --Comments

    -- -- Git
    -- "lewis6991/gitsigns.nvim",
    -- --Editing support
    -- "windwp/nvim-autopairs",  -- pairs the brackets
    -- "windwp/nvim-ts-autotag", -- pairs the brackets for html tags (works tsx, html, vue, rescript, svelte, php)
    -- "mbbill/undotree",
    -- "gelguy/wilder.nvim",
    -- Peronal plugins
}, {
    defaults = { lazy = true },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = true },
    ui = { border = "rounded" },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                "netrwPlugin",
            },
        },
    },
    debug = false,
})
