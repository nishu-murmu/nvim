return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {},
    },
}
