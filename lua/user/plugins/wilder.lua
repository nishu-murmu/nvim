local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
    return
else
    wilder.setup({ modes = { ":", "/", "?" } })
    wilder.set_option("pipeline", {
        wilder.branch(
            wilder.python_file_finder_pipeline({
                ripgrep = { "rg", "--files" },
                fd = { "fd", "-tf" },
                file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
                dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
                filters = { "fuzzy_filter", "difflib_sorter" },
            }),
            wilder.cmdline_pipeline(),
            wilder.python_search_pipeline()
        ),
    })
end
