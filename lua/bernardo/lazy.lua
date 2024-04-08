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
  -- plugins
  require("bernardo.plugins.telescope"),
  require('bernardo.plugins.lua-line'),
  require('bernardo.plugins.treesitter'),
  require('bernardo.plugins.lsp-zero'),
  require('bernardo.plugins.autopairs'),
  require('bernardo.plugins.alpha'),
  require('bernardo.plugins.formatting'),
  require('bernardo.plugins.copilot'),
  require('bernardo.plugins.copilot-chat'),
  require('bernardo.plugins.nvim-comment'),
  require('bernardo.plugins.gitsigns'),
  require('bernardo.plugins.minifiles'),

  -- themes
  require("bernardo.plugins.rose-pine"),

  -- sporadic
  require('bernardo.plugins.vim-be-good'),
})
