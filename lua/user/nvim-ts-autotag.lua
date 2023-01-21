local status_ok, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
    return
end

nvim_ts_autotag.setup({
    filetypes = {
        "html",
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "js",
        "ts",
        "jsx",
        "tsx",
    },
})
