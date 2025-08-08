return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'jay-babu/mason-nvim-dap.nvim',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason-nvim-dap').setup({
        ensure_installed = { 'js-debug-adapter' },
        handlers = {},
      })
      
      local dap = require('dap')
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter', -- Comando do adaptador
          args = { '${port}' },
        },
      }

      dap.adapters['pwa-chrome'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }

      local dapui = require('dapui')
      dapui.setup()

      local dap = require('dap')
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

      dap.configurations.typescript = {
        {
          type = 'pwa-node',
          name = 'Debug File (Node.js)',
          request = 'launch',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          name = 'Debug App (Chrome)',
          request = 'launch',
          url = function() return vim.fn.input('URL: ', 'http://localhost:5173') end,
          webRoot = '${workspaceFolder}',
        },
      }
      dap.configurations.javascript = dap.configurations.typescript
      dap.configurations.vue = dap.configurations.typescript

      vim.keymap.set('n', '<F5>', dap.continue, { desc = "DAP: Iniciar/Continuar" })
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "DAP: Alternar Breakpoint" })
    end,
  },
}
