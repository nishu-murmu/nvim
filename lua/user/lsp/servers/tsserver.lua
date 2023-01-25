local util = require("lspconfig.util")

return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
        hostInfo = "neovim",
    },
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}
