local remaps = {}

-- Editor
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

-- Windows
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wc", "<C-w>c")
vim.keymap.set("n", "<leader>wo", "<C-w>o")

-- Color Picker
vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>")
vim.keymap.set("i", "<leader>cp", "<cmd>PickColorInsert<cr>")

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

-- LSP
remaps.lsp = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>im", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- CMP
remaps.cmp = function(cmp)
  local select = { behavior = cmp.SelectBehavior.Select }
  return {
    ['<S-k>'] = cmp.mapping.select_prev_item(select),
    ['<S-j>'] = cmp.mapping.select_next_item(select),
    ['<S-l>'] = cmp.mapping.confirm({ select = true }),
    ['<S-h>'] = cmp.mapping.complete(),
  }
end

-- lua
vim.keymap.set('n', '<leader>gc', ':lua CommitWithTelescope()<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>k', ":lua MoveSelectedLines('up')<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<leader>j', ":lua MoveSelectedLines('down')<CR>", { noremap = true, silent = true })

return remaps
