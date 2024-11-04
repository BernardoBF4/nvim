return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lsp_zero = require('bernardo.plugins.lsp.setup')

      require('mason-lspconfig').setup({
        ensure_installed = { 'ts_ls', 'volar', 'html', 'intelephense', 'cssls', 'jsonls', 'lua_ls', 'pyright' },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  },
}
