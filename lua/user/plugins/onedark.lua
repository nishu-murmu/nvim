return {
  'navarasu/onedark.nvim',
  event = 'BufReadPost',
  config = function()
    vim.cmd.colorscheme('onedark')
  end,
}
