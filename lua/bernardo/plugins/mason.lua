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
      local lsp_zero = require('lsp-zero')

      local lua_opts = lsp_zero.nvim_lua_ls()
      vim.lsp.config('lua_ls', lua_opts)

      vim.lsp.config('vue_ls', {
        filetypes = { 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      })

      vim.lsp.config('ts_ls', {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.expand("$HOME") .. "/.nvm/versions/node/v23.2.0/lib/node_modules/@vue/language-server",
              languages = { 'vue' },
            },
          },
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = { 'ts_ls', 'vue_ls', 'html', 'intelephense', 'cssls', 'jsonls', 'lua_ls', 'pyright' },
        automatic_enable = true,
      })
    end
  },
}
