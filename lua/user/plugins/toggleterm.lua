local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

if status_ok then
    toggleterm.setup({})
end
