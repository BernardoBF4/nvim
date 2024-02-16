vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set({ "i", "v" }, "jk", "<esc>")
vim.keymap.set("n", "<leader>cs", "<cmd>nohl<cr>")
vim.keymap.set({ "n", "v" }, "ç", "%")
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
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>")

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
