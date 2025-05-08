local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- plugins
  require("bernardo.plugins.telescope"),
  require('bernardo.plugins.lua-line'),
  require('bernardo.plugins.treesitter'),
  require('bernardo.plugins.lsp.lsp'),
  require('bernardo.plugins.cmp'),
  require('bernardo.plugins.autopairs'),
  require('bernardo.plugins.alpha'),
  require('bernardo.plugins.formatting'),
  require('bernardo.plugins.nvim-comment'),
  require('bernardo.plugins.gitsign'),
  require('bernardo.plugins.mason'),
  require('bernardo.plugins.fugitive'),
  require('bernardo.plugins.color-picker'),
  require('bernardo.plugins.drop'),

  -- themes
  require("bernardo.plugins.rose-pine"),
  require("bernardo.plugins.kanagawa"),

  -- sporadic
  require('bernardo.plugins.vim-be-good'),
})
