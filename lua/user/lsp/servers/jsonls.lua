return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  -- root_dir=util.find_git_ancestor,
  single_file_support = true,
}
