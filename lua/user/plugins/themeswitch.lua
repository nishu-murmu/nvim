return {
  'nishu-murmu/ThemeSwitch.nvim',
  event = 'BufReadPost',
  config = function()
    local status_ok, theme_switch = pcall(require, 'ThemeSwitch')
    if not status_ok then
      return
    else
      theme_switch.setup({})
    end
  end,
}
