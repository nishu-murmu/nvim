local util = require('lspconfig.util')
return {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_dir = util.root_pattern('.git'),
}
