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
                file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
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
        wilder.renderer_mux({
            [":"] = wilder.popupmenu_renderer({
                highlighter = wilder.basic_highlighter(),
            }),
            ["/"] = wilder.wildmenu_renderer({
                highlighter = wilder.basic_highlighter(),
            }),
        })
    )
end
