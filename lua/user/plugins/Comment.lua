return {
    "numToStr/Comment.nvim",
    dependencies = { "nvim-ts-context-commentstring" },
    event = "BufReadPost",
    config = function()
        local status_ok, Comment = pcall(require, "Comment")
        if not status_ok then
            return
        else
            Comment.setup()
        end

        local ts_status, ts_comment_string = pcall(require, "nvim-ts-context-commentstring")

        if not ts_status then
            return
        else
            ts_comment_string.setup({
                context_commentstring = {
                    enable = true,
                    config = {
                        typescript = { __default = "// %s", __multiline = "{/* %s */}" },
                    },
                },
            })
        end
    end,
}
