function Colorscheme(color)
    -- Lua
    require("onedark").setup({
        style = "darker",
    })
    require("onedark").load()
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorscheme()
