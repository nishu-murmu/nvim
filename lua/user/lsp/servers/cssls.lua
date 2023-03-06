return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    -- root_dir = (package.json),
    settings = {
        css = {
            validate = true,
        },
        less = {
            validate = true,
        },
        scss = {
            validate = true,
        },
        lint = {
            unknownAtRules = 'ignore'
        }
    },
    single_file_support = true,
}
