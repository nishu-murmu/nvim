return {
  {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
      if not lspconfig_status_ok then
        return
      end

      local opts = {}
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

      local on_attach = function(client, bufnr)
        lsp_highlight_document(client, bufnr)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      for _, server in ipairs(servers) do
        local server_name = vim.split(server, '@')[1]
        opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server_name == 'lua_ls' then
          local lua_ls = require('user.lsp.servers.lua_ls')
          opts = vim.tbl_deep_extend('force', lua_ls, opts)
        elseif server_name == 'pyright' then
          local pyright_opts = require('user.lsp.servers.pyright')
          opts = vim.tbl_deep_extend('force', pyright_opts, opts)
        elseif server_name == 'emmet_ls' then
          local emmet_ls_opts = require('user.lsp.servers.emmet_ls')
          opts = vim.tbl_deep_extend('force', emmet_ls_opts, opts)
        elseif server_name == 'tailwindcss' then
          local tailwindcss_opts = require('user.lsp.servers.tailwindcss')
          opts = vim.tbl_deep_extend('force', tailwindcss_opts, opts)
        elseif server_name == 'ts_ls' then
          local tsserver_opts = require('user.lsp.servers.tsserver')
          opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
        elseif server_name == 'gopls' then
          local gopls_server = require('user.lsp.servers.gopls')
          opts = vim.tbl_deep_extend('force', gopls_server, opts)
        elseif server_name == 'jsonls' then
          local jsonls_opts = require('user.lsp.servers.jsonls')
          opts = vim.tbl_deep_extend('force', jsonls_opts, {})
        elseif server_name == 'cssls' then
          local cssls_opts = require('user.lsp.servers.cssls')
          opts = vim.tbl_deep_extend('force', cssls_opts, opts)
        elseif server_name == 'bashls' then
          local bashls_opts = require('user.lsp.servers.bashls')
          opts = vim.tbl_deep_extend('force', bashls_opts, opts)
        end
        lspconfig[server_name].setup(opts)
      end
    end,

    vim.diagnostic.config({
      virtual_text = {
        prefix = '',
      },
      virtual_lines = true,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '󰋼',
          [vim.diagnostic.severity.HINT] = '󰌵',
        },
      },
      float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = true,
      },
    })
  }
}

