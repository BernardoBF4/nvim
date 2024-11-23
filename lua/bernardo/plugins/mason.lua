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
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup(lua_opts)
            lspconfig.volar.setup({
              filetypes = { 'javascriptreact', 'typescriptreact', 'vue' },
              init_options = {
                vue = {
                  hybridMode = false,
                },
              },
            })
            lspconfig.ts_ls.setup({
              init_options = {
                plugins = {
                  {
                    name = '@vue/typescript-plugin',
                    location = '/home/bernardo/.nvm/versions/node/v23.2.0/lib/node_modules/@vue/language-server',
                    languages = { 'vue' },
                  },
                },
              },
            })
            lspconfig.volar.setup({
              init_options = {
                vue = {
                  hybridMode = false,
                },
              },
            })
          end,
        }
      })
    end
  },
}
