return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    local status_ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
    if not status_ok then
      return
    end
    nvim_web_devicons.setup({
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
