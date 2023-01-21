local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
  else
bufferline.setup({
    options = {
        numbers = "ordinal",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true, -- use a "true" to enable the default, or set your own character
            },
        },
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        groups = {
            options = {
                toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
            },
            items = {
                require("bufferline.groups").builtin.pinned:with({ icon = "" }),
                {
                    name = "components", -- Mandatory
                    highlight = { underline = true, sp = "blue" }, -- Optional
                    priority = 2, -- determines where it will appear relative to other groups (Optional)
                    auto_close = true,
                    matcher = function(buf) -- Mandatory
                        return buf.filename:match("%.tsx")
                            or buf.filename:match("%.jsx")
                            or buf.filename:match("%.ts")
                            or buf.filename:match("%.js")
                    end,
                },
                {
                    name = "Docs",
                    highlight = { undercurl = true, sp = "green" },
                    auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
                    matcher = function(buf)
                        return buf.filename:match("%.md") or buf.filename:match("%.txt")
                    end,
                },
            },
        },
    },
})
end


