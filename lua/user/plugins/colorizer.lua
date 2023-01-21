local status_ok, colorizer = pcall(require,"colorizer")
if not status_ok then
  return
else
colorizer.setup({
	"javascript",
	html = { mode = "background" },
}, { mode = "foreground" })
end
