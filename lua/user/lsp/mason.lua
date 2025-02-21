return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {}, build = ':MasonUpdate' },
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim' },
    'hrsh7th/cmp-nvim-lsp',
  },
  event = 'BufReadPost',
  opts = {
    settings = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '◍',
          package_pending = '◍',
          package_uninstalled = '◍',
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
    servers = {
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
      'vimls',
    },
    signs = {
      { name = 'DiagnosticSignError', text = '' },
      { name = 'DiagnosticSignWarn', text = '' },
      { name = 'DiagnosticSignHint', text = '' },
      { name = 'DiagnosticSignInfo', text = '' },
    },
    config = {
      virtual_text = {
        prefix = '',
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
      },
    },
  },
  config = function()
    local setup = function()
      local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
      end

      local config = {
        -- disable virtual text
        virtual_text = {
          prefix = '',
        },
        -- show signs
        -- signs = {
        --   active = signs,
        -- },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          -- header = "",
          -- prefix = "",
        },
      }

      vim.diagnostic.config(config)

      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
      })

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
      })
    end

    local function lsp_highlight_document(client, bufnr)
      if client.supports_method('textDocument/documentHighlight') then
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
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        '[d',
        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        'gl',
        '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        ']d',
        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

      -- formatting
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

    setup()

    local on_attach = function(client, bufnr)
      lsp_keymaps(client, bufnr)
      -- lsp_highlight_document(client)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not status_ok then
      return
    end

    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    local status_ok_1, mason = pcall(require, 'mason')
    if not status_ok_1 then
      return
    end

    local status_ok_2, mason_lspconfig = pcall(require, 'mason-lspconfig')
    if not status_ok_2 then
      return
    end

    local settings = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '◍',
          package_pending = '◍',
          package_uninstalled = '◍',
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

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
    }

    mason.setup(settings)
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
    if not lspconfig_status_ok then
      return
    end

    local opts = {}

    for _, server in pairs(servers) do
      opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      server = vim.split(server, '@')[1]

      if server == 'lua_ls' then
        local lua_ls = require('user.lsp.servers.lua_ls')
        opts = vim.tbl_deep_extend('force', lua_ls, opts)
      end
      if server == 'pyright' then
        local pyright_opts = require('user.lsp.servers.pyright')
        opts = vim.tbl_deep_extend('force', pyright_opts, opts)
      end

      if server == 'emmet_ls' then
        local emmet_ls_opts = require('user.lsp.servers.emmet_ls')
        opts = vim.tbl_deep_extend('force', emmet_ls_opts, opts)
      end

      if server == 'tailwindcss' then
        local tailwindcss_opts = require('user.lsp.servers.tailwindcss')
        opts = vim.tbl_deep_extend('force', tailwindcss_opts, opts)
      end

      if server == 'ts_ls' then
        local tsserver_opts = require('user.lsp.servers.tsserver')
        opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
      end

      if server == 'jsonls' then
        local jsonls_opts = require('user.lsp.servers.jsonls')
        opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
      end

      if server == 'cssls' then
        local cssls_opts = require('user.lsp.servers.cssls')
        opts = vim.tbl_deep_extend('force', cssls_opts, opts)
      end

      if server == 'bashls' then
        local bashls_opts = require('user.lsp.servers.bashls')
        opts = vim.tbl_deep_extend('force', bashls_opts, opts)
      end

      lspconfig[server].setup(opts)
    end
  end,
}
