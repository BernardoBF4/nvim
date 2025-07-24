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
      local messages = vim.fn.readfile(vim.fn.expand('~/.config/nvim/lua/bernardo/default-commit-messages.txt'))

      require('telescope.pickers').new({}, {
        prompt_title = 'Select Commit Message',
        finder = require('telescope.finders').new_table {
          results = messages,
        },
        sorter = require('telescope.config').values.generic_sorter({}),
        attach_mappings = function(_, map)
          map('i', '<CR>', function(prompt_bufnr)
            local selection = action_state.get_selected_entry()

            if not selection or selection[1]:match("^%s*%-+ .+ %-+%s*$") then
              return
            end

            actions.close(prompt_bufnr)

            local commit_message = selection[1]:match('^[^:]+:')
            if commit_message then
              vim.cmd('G commit')
              vim.cmd('normal! i' .. commit_message)
              vim.cmd('stopinsert')
            end
          end)
          return true
        end,
      }):find()
    end

    telescope.setup({
      defaults = {
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s        | %s", tail, path)
        end,
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
