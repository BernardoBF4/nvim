return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ensure_installed = {
          'java-debug-adapter',
          'java-test',
          'eslint-lsp'
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lsp_zero = require('lsp-zero')

      vim.lsp.config('lua_ls', lsp_zero.nvim_lua_ls())

      vim.lsp.config('vue_ls', {
        on_init = function(client)
          client.handlers['tsserver/request'] = function(_, result, context)
            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
            if #clients == 0 then
              vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
              return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
              command = 'typescript.tsserverRequest',
              arguments = {
                command,
                payload,
              },
            }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify('tsserver/response', response_data)
            end)
          end
        end,
      })

      vim.lsp.config('vtsls', {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = vim.fn.stdpath('data') ..
                      "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                  languages = { 'vue' },
                  configNamespace = 'typescript',
                },
              },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      })

      vim.lsp.config('eslint', {
        settings = {
          workingDirectory = { mode = 'auto' },
        },
      })

      vim.lsp.enable({ 'vtsls', 'vue_ls', 'eslint' })

      require('mason-lspconfig').setup({
        ensure_installed = { 'vue_ls', 'eslint', 'html', 'intelephense', 'cssls', 'jsonls', 'lua_ls', 'pyright', 'jdtls' },
        automatic_enable = true,
      })
    end
  },
}
