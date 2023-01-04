require("mason").setup()
require("mason-lspconfig").setup_handlers({
	function(server)
		require("lspconfig")[server].setup({
			on_attach = require("user.lsp.diagnostics").on_attach,
			capabilities = require("user.lsp.diagnostics").capabilities,
		})
	end,
})
