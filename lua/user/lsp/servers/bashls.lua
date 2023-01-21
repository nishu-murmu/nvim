return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh" },
    cmd_env = {
        GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
    },
    single_file_support = true,
}
