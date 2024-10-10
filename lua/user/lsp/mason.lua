return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {}, build = ":MasonUpdate" },
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        "hrsh7th/cmp-nvim-lsp",
    },
    event = "BufReadPost",
    opts = {
        settings = {
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
        },
        servers = {
            "pyright",
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
            "tailwindcss",
            "cssls",
            "cssmodules_ls",
            "bashls",
            "emmet_ls",
            "html",
            "jsonls",
            "vimls",
        },
        signs = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
        },
        config = {
            virtual_text = {
                prefix = "",
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
            },
        },
    },
    config = function(_, opts)
        local status_ok, mason = pcall(require, "mason")
        if not status_ok then
            return
        end

        local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
        if not status_ok_1 then
            return
        end

        local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
        if not lspconfig_status_ok then
            return
        end
        for _, server in pairs(opts.servers) do
            server = vim.split(server, "@")[1]

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
            capabilities.workspace.fileOperations = { didRename = true, willRename = true }

            if server == "lua_ls" then
                local lua_ls = require("user.lsp.servers.lua_ls")
                opts = vim.tbl_deep_extend("force", lua_ls, opts)
            end
            if server == "pyright" then
                local pyright_opts = require("user.lsp.servers.pyright")
                opts = vim.tbl_deep_extend("force", pyright_opts, opts)
            end

            if server == "emmet_ls" then
                local emmet_ls_opts = require("user.lsp.servers.emmet_ls")
                opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
            end

            if server == "tailwindcss" then
                local tailwindcss_opts = require("user.lsp.servers.tailwindcss")
                opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
            end

            if server == "ts_ls" then
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

            if server == "bashls" then
                local bashls_opts = require("user.lsp.servers.bashls")
                opts = vim.tbl_deep_extend("force", bashls_opts, opts)
            end

            lspconfig[server].setup(opts)
        end
        mason.setup(opts.settings)
        mason_lspconfig.setup({
            ensure_installed = opts.servers,
            automatic_installation = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
            callback = function(event)
                require("custom.plugins.lsp.keymaps")(event.buf)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(detach_event)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({
                                group = "custom-lsp-highlight",
                                buffer = detach_event.buf,
                            })
                        end,
                    })
                end
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    vim.keymap.set("n", "<leader>uh", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, { desc = "Toggle inlay hints", buffer = event.buf })
                end
            end,
        })

        for _, sign in ipairs(opts.signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end
        vim.diagnostic.config(opts.config)

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
    end,
}
