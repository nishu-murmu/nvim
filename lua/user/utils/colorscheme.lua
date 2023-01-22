local status_ok, ondedark = pcall(require, "onedark")
if not status_ok then
    return
else
    ondedark.setup({
        style = "darker",
    })
    ondedark.load()
end
