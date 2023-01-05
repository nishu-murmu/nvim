local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

local servers = {
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver",
    "cssls",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "jdtls",
    "jsonls",
}

mason.setup(settings)
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.diagnostics").on_attach,
        capabilities = require("user.lsp.diagnostics").capabilities,
    }
    server = vim.split(server, "@")[1]

    if server == "pyright" then
        local pyright_opts = require("user.lsp.servers.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "emmet_ls" then
        local emmet_ls_opts = require("user.lsp.servers.emmet_ls")
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    if server == "tsserver" then
        local tsserver_opts = require("user.lsp.servers.tsserver")
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "jsonls" then
        local jsonls_opts = require("user.lsp.servers.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "cssls" then
        local cssls_opts = require("user.lsp.servers.cssls")
        opts = vim.tbl_deep_extend("force", cssls_opts, opts)
    end

    lspconfig[server].setup(opts)
end
