return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    event = "BufReadPost",
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
