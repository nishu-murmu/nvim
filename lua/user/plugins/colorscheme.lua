return {
  'navarasu/onedark.nvim',
  event = 'BufReadPost',
  config = function()
    vim.cmd.colorscheme('peachpuff')
  end,
}
