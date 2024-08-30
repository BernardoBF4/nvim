return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_state = require('telescope.actions.state')

    function CommitWithTelescope()
      require('telescope.pickers').new({}, {
        prompt_title = 'Select Commit Message',
        finder = require('telescope.finders').new_table {
          results = vim.fn.readfile(vim.fn.expand('./lua/bernardo/default-commit-messages.txt')),
        },
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(_, map)
          map('i', '<CR>', function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd('G commit')                  -- Abre o editor de commit do Fugitive
            vim.cmd('normal! i' .. selection[1]) -- Insere a mensagem no editor
            vim.cmd('stopinsert')                -- Volta para o modo normal
          end)
          return true
        end,
      }):find()
    end

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })
  end,
}
