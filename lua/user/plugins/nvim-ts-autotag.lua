require("nvim-treesitter.configs").setup({
    autotag = {
        enable = true,
        filetypes = {
            "html",
            "js",
            "jsx",
            "ts",
            "tsx",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
        },
    },
})
