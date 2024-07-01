vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set({ "i", "v" }, "jk", "<esc>")
vim.keymap.set({ "i", "v" }, "kj", "<esc>")
vim.keymap.set("n", "<leader>cs", "<cmd>nohl<cr>")
vim.keymap.set({ "n", "v" }, "ç", "%")
vim.keymap.set({ "n", "v" }, "M", "^")
vim.keymap.set({ "n", "v" }, "m", "$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Buffers
vim.keymap.set("n", "<leader>.", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>,", "<cmd>bprev<cr>")

-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files hidden=true show_untracked=true<cr>")
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fqf", telescope_builtin.quickfix)
vim.keymap.set("n", "<leader>fsh", telescope_builtin.search_history)
vim.keymap.set("n", "<leader>ft", telescope_builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>fd", telescope_builtin.lsp_definitions)
vim.keymap.set("n", "<leader>fi", telescope_builtin.lsp_implementations)

-- NvimTree
local minifiles = require('mini.files')
vim.keymap.set("n", "<leader>ee", minifiles.open)

-- GitSigns
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>gS', gitsigns.undo_stage_hunk)
vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('v', '<leader>gS', function() gitsigns.unde_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk)
vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk)
vim.keymap.set('n', '<leader>gN', function()
  gitsigns.next_hunk()
  gitsigns.preview_hunk()
end)
vim.keymap.set('n', '<leader>gsa', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>gd', function() gitsigns.diffthis('~') end)
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted)

-- Copilot Chat
vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CopilotChatToggle<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>ce', '<cmd>CopilotChatExplain<cr>')
vim.keymap.set('n', '<leader>co', '<cmd>CopilotChatOptimize<cr>')
vim.keymap.set('n', '<leader>cf', '<cmd>CopilotChatFix<cr>')
vim.keymap.set('n', '<leader>ct', '<cmd>CopilotChatTests<cr>')

-- Conform
vim.keymap.set(
  { "n", "v" },
  "<leader>mp",
  function()
    require("conform").format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end,
  { desc = "Formata o arquivo (no modo visual é aplicado ao que está selecionado)" }
)
