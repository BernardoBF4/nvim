return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript',
        'typescript',
        'php',
        'html',
        'lua',
        'json',
        'scss',
        'css',
        'sql',
      },
      enable = true,
      highlight = {
        enable = true,
      },
    })
  end
}
