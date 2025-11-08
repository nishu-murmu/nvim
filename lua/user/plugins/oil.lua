return {
  'stevearc/oil.nvim',
  event = 'BufReadPre',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    columns = {
      'icon',
    },
    keymaps = {
      ['<C-h>'] = false,
    },
    default_file_explorer = true, -- Replace netrw
    view_options = {
      show_hidden = true, -- Show hidden files by default
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git' -- Optionally exclude specific files/folders
      end,
    },
  },
  config = function(_, opts)
    require('oil').setup(opts)
    vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open Parent Directory' })
    vim.keymap.set('n', '<leader>-', require('oil').toggle_float)
  end,
}
