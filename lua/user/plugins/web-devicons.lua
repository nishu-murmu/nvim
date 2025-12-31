return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    local ok, icons = pcall(require, 'nvim-web-devicons')
    if not ok then
      return
    end
    icons.setup({
      override = {
        zsh = {
          icon = '',
          color = '#428850',
          cterm_color = '65',
          name = 'Zsh',
        },
      },
      default = true,
    })
  end,
}
