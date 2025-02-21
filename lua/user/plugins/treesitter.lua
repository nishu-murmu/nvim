return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  config = function()
    require('nvim-treesitter.install').compilers = { 'clang', 'gcc', 'zig' }
    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup({
      compilers = { 'clang', 'gcc' },
      ensure_installed = {
        'lua',
        'c',
        'cpp',
        'css',
        'scss',
        'bash',
        'javascript',
        'python',
        'rust',
        'typescript',
        'html',
        'fish',
        'json',
        'go',
        'make',
        'markdown',
        'yaml',
        'vim',
        'vimdoc',
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      ignore_install = { 'phpdoc', 'vimdoc' }, -- List of parsers to ignore installing
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { 'yaml', 'vimdoc' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    })
    vim.cmd([[
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
    ]])
  end,
}
