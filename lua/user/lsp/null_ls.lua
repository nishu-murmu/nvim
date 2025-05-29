return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = 'BufReadPost',
  config = function()
    local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
    if not null_ls_status_ok then
      return
    end

    local formatting = null_ls.builtins.formatting
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      debug = false,
      sources = {
        formatting.prettier.with({ extra_args = { '--double-quote' } }),
        formatting.stylua,
        code_actions.gitsigns,
      },
    })
  end,
}
