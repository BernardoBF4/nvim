return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("CopilotChat").setup({
      name = 'Copilot',
      show_user_selection = false,
      prompts = {
        Explain = {
          mapping = '<leader>ae',
          description = 'AI Explain',
        },
        Tests = {
          mapping = '<leader>at',
          description = 'AI Tests',
        },
        Fix = {
          mapping = '<leader>af',
          description = 'AI Fix',
        },
        Optimize = {
          mapping = '<leader>ao',
          description = 'AI Optimize',
        },
        Docs = {
          mapping = '<leader>ad',
          description = 'AI Documentation',
        },
        FixDiagnostic = {
          mapping = '<leader>ar',
          description = 'AI Fix Diagnostic',
        },
        CommitStaged = {
          mapping = '<leader>ac',
          description = 'AI Generate Commit',
        },
      },
    })
  end,
}
