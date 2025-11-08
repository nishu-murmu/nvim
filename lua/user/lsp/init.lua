return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
    config = function()
      local servers = {
        'pyright',
        'lua_ls',
        'rust_analyzer',
        'ts_ls',
        'tailwindcss',
        'cssls',
        'cssmodules_ls',
        'bashls',
        'emmet_ls',
        'html',
        'jsonls',
        'vimls',
        'gopls',
        'astro'
      }

      local function lsp_highlight_document(client, bufnr)
        if client:supports_method('textDocument/documentHighlight') then
          local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd('CursorMoved', {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      local function lsp_keymaps(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('Format', { clear = true }),
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

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local opts = {}

      opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.config("*", opts)
      vim.lsp.enable(servers, true)
    end,
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
    }),
  },
}
