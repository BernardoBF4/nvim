local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require('bernardo.plugins.nvim-tree'),
  require("bernardo.plugins.telescope"),
  require('bernardo.plugins.lua-line'),
  require('bernardo.plugins.treesitter'),
  require('bernardo.plugins.lsp-zero'),

  -- themes
  require("bernardo.plugins.rose-pine"),

  -- sporadic
  require('bernardo.plugins.vim-be-good'),
})
