return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<CR>', desc = 'Find files' },
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
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden', -- Include hidden files
            '--glob=!**/.git/*', -- Exclude .git directory
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- Show hidden files in find_files
            find_command = {
              'rg',
              '--files',
              '--hidden',
              '--glob=!**/.git/*', -- Exclude .git
            },
          },
        },
      })
    end
  end,
}
