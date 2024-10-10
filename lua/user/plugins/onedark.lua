return {
    "navarasu/onedark.nvim",
    config = function()
        require("onedark").setup({
            style = "darker",
        })
        require("onedark").load()
    end,
}
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
