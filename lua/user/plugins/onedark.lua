return {
  'navarasu/onedark.nvim',
  event = 'BufReadPost',
  config = function()
    vim.cmd.colorscheme('onedark')
  end,
}
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
