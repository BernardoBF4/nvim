-- Exemplo para um novo arquivo lua/plugins/dap.lua
return {
  -- Plugin base para DAP
  { 'mfussenegger/nvim-dap' },
  -- UI para o DAP
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require('dap')
      vim.keymap.set('n', '<F5>', dap.continue, { desc = "DAP: Iniciar/Continuar" })
      vim.keymap.set('n', '<F6>', dap.terminate, { desc = "DAP: Terminar Sessão" })
      vim.keymap.set('n', '<F8>', dap.step_over, { desc = "DAP: Passar por Cima (Step Over)" })
      vim.keymap.set('n', '<F9>', dap.step_into, { desc = "DAP: Entrar em (Step Into)" })
      vim.keymap.set('n', '<F10>', dap.step_out, { desc = "DAP: Sair de (Step Out)" })
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = "DAP: Alternar Breakpoint" })
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = "DAP: Breakpoint Condicional" })

      local dapui = require('dapui')
      vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = "DAP: Alternar UI" })
    end
  },
}
