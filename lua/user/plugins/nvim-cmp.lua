return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', version = 'v2.*' },
  },
  event = 'BufReadPost',
  config = function()
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
      return
    end

    local snip_status_ok, luasnip = pcall(require, 'luasnip')
    if not snip_status_ok then
      return
    end
    require('luasnip.loaders.from_vscode').lazy_load()
    local lspkind = require('lspkind')

    lspkind.init()

    local lspkind = require('lspkind')
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function(_, vim_item)
            return vim_item
          end,
        }),
      },
      sources = {
        { name = 'nvim_lsp', priority = 50 },
        { name = 'nvim_lua', priority = 40 },
        { name = 'luasnip', priority = 30 },
        { name = 'buffer', priority = 20 },
        { name = 'path', priority = 10 },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    })
  end,
}

