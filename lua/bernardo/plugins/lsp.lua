return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'jose-elias-alvarez/null-ls.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local remaps = require('bernardo.remap')

      lsp_zero.preset('recommended')
      lsp_zero.set_preferences({
        manage_nvim_cmp = true, -- Disable lsp-zero's cmp setup to avoid conflicts
      })
      lsp_zero.on_attach(function(_, bufnr)
        remaps.lsp(_, bufnr)
      end)
      lsp_zero.setup()
    end,
  },
}
