return {
    "gelguy/wilder.nvim",
    config = function()
        local status_ok, wilder = pcall(require, "wilder")
        if not status_ok then
            return
        else
            wilder.setup({ modes = { ":", "/", "?" } })
            wilder.set_option("pipeline", {
                wilder.branch(
                    wilder.python_file_finder_pipeline({
                        -- to use ripgrep : {'rg', '--files'}
                        -- to use fd      : {'fd', '-tf'}
                        file_command = { "rg", "--files" },
                        -- to use fd      : {'fd', '-td'}
                        -- dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
                        dir_command = { "fd", "-td" },
                        filters = { "fuzzy_filter", "difflib_sorter" },
                    }),
                    wilder.cmdline_pipeline()
                ),
            })
            wilder.set_option(
                "renderer",
                wilder.popupmenu_renderer({
                    -- highlighter applies highlighting to the candidates
                    highlighter = wilder.basic_highlighter(),
                })
            )
        end
    end,
}
