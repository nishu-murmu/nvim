return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  config = function()
    local api = vim.api
    local servers = {
      'lua_ls',
      'cssls',
      'emmet_ls',
      'jsonls',
      'markdown_oxide',
      'pyright',
      'bashls',
      'rust_analyzer',
      'tailwindcss',
      'ts_ls',
      'gopls',
      'astro',
    }
    local custom_servers = {
      'cssls',
      'jsonls',
      'lua_ls',
      'rust_analyzer',
    }

    local function lsp_highlight_document(client, bufnr)
      if client:supports_method('textDocument/documentHighlight') then
        local group = api.nvim_create_augroup('lsp_document_highlight', { clear = true })
        api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = group,
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        api.nvim_create_autocmd('CursorMoved', {
          group = group,
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    local function lsp_keymaps(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        api.nvim_create_autocmd('BufWritePre', {
          group = api.nvim_create_augroup('Format', { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    local on_attach = function(client, bufnr)
      lsp_highlight_document(client, bufnr)
      lsp_keymaps(client, bufnr)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())
    local opts = {}
    opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    for _, server in ipairs(custom_servers) do
      local ok, _ = pcall(require, 'user.lsp.servers.' .. server)
      if not ok then
        return
      end
    end
    vim.lsp.config('*', opts)
    vim.lsp.enable(servers)
    vim.diagnostic.config({
      virtual_text = {
        prefix = '',
      },
      severity_sort = true,
      float = {
        border = 'rounded',
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '󰋼',
          [vim.diagnostic.severity.HINT] = '󰌵',
        },
      },
    })
  end,
}
