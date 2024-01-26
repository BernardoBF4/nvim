vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("v", "jk", "<esc>")
vim.keymap.set("n", "<leader>cs", "<cmd>nohl<cr>")
vim.keymap.set("n", "ç", "%")
vim.keymap.set("v", "ç", "%")

-- In normal mode, this allows me to move blocks of code up and down with J and K.
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
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope git_files hidden=true show_untracked=true<cr>")
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")

-- NvimTree
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<cr>")
