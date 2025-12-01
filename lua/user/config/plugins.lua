-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
return lazy.setup({
  -- My actual plugins that I use in my day to day basis.
  { import = 'user.plugins' },
  -- All my local plugins go in this folder in my local system.
  { import = 'dev.plugins' },
  -- My lsp configuration.
  { import = 'user.lsp' },
}, {
  defaults = { lazy = true },
  checker = { enabled = true },
  ui = { border = 'rounded' },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        'netrwPlugin',
      },
    },
  },
  debug = false,
})
