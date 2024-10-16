return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript',
        'typescript',
        'php',
        'tsx',
        'html',
        'lua',
        'json',
        'scss',
        'css',
        'sql',
        'vue',
      },
      enable = true,
      highlight = {
        enable = true,
      },
    })
  end
}
