return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'javascript', 'typescript' },
      enable = true,
      highlight = {
        enable = true,
      },
    })
  end
}
