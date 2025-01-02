local util = require('lspconfig.util')

return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  single_file_support = true,
  root_dir = util.find_git_ancestor,
}
