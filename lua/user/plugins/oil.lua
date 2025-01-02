return {
  'stevearc/oil.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      columns = {
        'icon',
      },
      keymaps = {
        ['<C-h>'] = false,
      },
    })
    vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open Parent Directory' })
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
}
