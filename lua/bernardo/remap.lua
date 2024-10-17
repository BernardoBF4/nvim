local remaps = {}

-- Editor
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Abre a navegação nas pastas/arquivos" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Salva as alterações do buffer" })
vim.keymap.set({ "i", "v" }, "jk", "<esc>", { desc = "Voltar para o modo normal" })
vim.keymap.set({ "i", "v" }, "kj", "<esc>", { desc = "Voltar para o modo normal" })
vim.keymap.set("n", "<leader>cs", "<cmd>nohl<cr>", { desc = "Limpar busca dentro do arquivo" })
vim.keymap.set({ "n", "v" }, "ç", "%", { desc = "Ir para o outro par do bloco" })
vim.keymap.set({ "n", "v" }, "M", "^", { desc = "Ir para o começo da linha" })
vim.keymap.set({ "n", "v" }, "m", "$", { desc = "Ir para o final da linha" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover bloco para baixo" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover bloco para cima" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Puxa a linha de baixo para o final da linha de cima" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Mover para baixo a página" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Mover para cima a página" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Ir para o próximo resultado da busca" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Ir para o resultado anterior da busca" })

-- Buffers
vim.keymap.set("n", "<leader>.", "<cmd>bnext<cr>", { desc = "Ir para o próximo buffer" })
vim.keymap.set("n", "<leader>,", "<cmd>bprev<cr>", { desc = "Voltar para o buffer anterior" })

-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files hidden=true show_untracked=true<cr>")
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files<cr>", { desc = "Voltar para o buffer anterior" })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Listar os buffers" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Busca textual em todos os arquivos" })
vim.keymap.set("n", "<leader>fqf", telescope_builtin.quickfix, { desc = "Busca textual em todos os arquivos" })
vim.keymap.set("n", "<leader>fh", telescope_builtin.search_history, { desc = "Lista o histórico de buscas" })
vim.keymap.set("n", "<leader>ft", telescope_builtin.lsp_document_symbols, { desc = "Lista os símbolos de um buffer" })
vim.keymap.set("n", "<leader>fd", telescope_builtin.lsp_definitions, { desc = "Listar todas a definição" })
vim.keymap.set("n", "<leader>fi", telescope_builtin.lsp_implementations, { desc = "Listar todas as implementações" })

-- NvimTree
local minifiles = require('mini.files')
vim.keymap.set("n", "<leader>ee", minifiles.open, { desc = "Abre o editor/navegação de arquivos" })

-- GitSigns
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Adiciona uma alteração ao stage" })
vim.keymap.set('n', '<leader>gS', gitsigns.undo_stage_hunk, { desc = "Remove uma alteração do stage" })
vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
  { desc = "Adiciona as alterações de um bloco ao stage" })
vim.keymap.set('v', '<leader>gS', function() gitsigns.unde_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
  { desc = "Remove as alterações de um bloco do stage" })
vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reverte as alterações do hunk" })
vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
  { desc = "Reverte as alterações do hunk de um bloco" })
vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, { desc = "Vai para o próximo hink" })
vim.keymap.set('n', '<leader>gN', function()
  gitsigns.next_hunk()
  gitsigns.preview_hunk()
end, { desc = "Vai para o próximo hunk e abre o preview" })
vim.keymap.set('n', '<leader>ga', gitsigns.stage_buffer, { desc = "Adiciona todas as alterações do buffer ao stage" })
vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = "Mostra a alteração do hunk" })
vim.keymap.set('n', '<leader>gd', function() gitsigns.diffthis('~') end, { desc = "Mosta o diff em duas janelas" })
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = "Mostra o blame na linha atual" })
vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = "Mostra o que foi deletado" })

-- Windows
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Vai pra janela de baixo" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Vai pra janela de cima" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Vai pra janela da esquerda" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Vai pra janela da direita" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Abre uma nova janela ao lado" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Abre uma nova janela abaixo" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Fecha a janela atual" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Fecha as outras janelas que não a que você está" })

-- Color Picker
vim.keymap.set("n", "<leader>cp", "<cmd>PickColor<cr>", { desc = "Abrir janela de seleção de cor" })

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
  function makeOptions(description)
    return { buffer = bufnr, remap = false, desc = description }
  end

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, makeOptions("Mostra a definição"))
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
    makeOptions("Abre o popup de diagnósticos"))
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, makeOptions("Vai para o próximo diagnóstico"))
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, makeOptions("Volta para o diagnóstico anterior"))
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, makeOptions("Abre as code actions"))
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, makeOptions("Renomeia um símbolo"))
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, makeOptions("Vai para a redifinição do símbolo"))
  vim.keymap.set("n", "<leader>im", function() vim.lsp.buf.references() end, makeOptions("Listar implementação"))
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
vim.keymap.set('n', '<leader>gc', ':lua CommitWithTelescope()<CR>',
  { noremap = true, silent = true, desc = "Commitar com mensagens pré-definidas" })
vim.keymap.set('v', '<leader>k', ":lua MoveSelectedLines('up')<CR>",
  { noremap = true, silent = true, desc = "Mover um bloco X linhas para baixo" })
vim.keymap.set('v', '<leader>j', ":lua MoveSelectedLines('down')<CR>",
  { noremap = true, silent = true, desc = "Mover um bloco X linhas para baixo" })

return remaps
