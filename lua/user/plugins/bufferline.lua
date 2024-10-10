return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

-- local status_ok, bufferline = pcall(require, "bufferline")
-- if not status_ok then
--     return
-- else
--     bufferline.setup({
--         options = {
--             numbers = "ordinal",
--             offsets = {
--                 {
--                     filetype = "NvimTree",
--                     text = "File Explorer",
--                     highlight = "Directory",
--                     separator = true, -- use a "true" to enable the default, or set your own character
--                 },
--             },
--             separator_style = "thin",
--             diagnostics = "nvim_lsp",
--         },
--     })
-- end
