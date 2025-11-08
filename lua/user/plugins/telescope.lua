return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>f',
      "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
      desc = 'Find files',
    },
    { '<leader>b', '<cmd>Telescope buffers<CR>', desc = 'Find Buffers' },
    { '<leader>sg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
    { '<leader>th', '<cmd>Telescope help_tags<CR>', desc = 'Help Tags' },
    { '<leader>tl', '<cmd>Telescope git_files<CR>', desc = 'Git Files' },
  },
  config = function()
    local status_ok, telescope = pcall(require, 'telescope')
    if not status_ok then
      return
    else
      telescope.setup({})
    end
  end,
}
