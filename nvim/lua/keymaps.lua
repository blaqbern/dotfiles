vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)

vim.keymap.set("n", "<leader>u", "viwu")
vim.keymap.set("n", "<leader>U", "viwU")

vim.keymap.set("n", "+", vim.cmd.bn)
vim.keymap.set("n", "_", vim.cmd.bp)

vim.keymap.set("n", "=", "ddkP")
vim.keymap.set("n", "-", "ddp")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "=", ":move '<-2<CR>gv=gv")
vim.keymap.set("v", "-", ":move '>+1<CR>gv=gv")

vim.keymap.set("n", "G", "mzJ`z")

vim.keymap.set({"n", "v"}, "J", "<C-d>zz")
vim.keymap.set({"n", "v"}, "K", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"n", "v"}, "H", "0")
vim.keymap.set({"n", "v"}, "L", "$")

vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("x", "<leader>P", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>f", vim.cmd.copen)
vim.keymap.set("n", "<leader>g", vim.cmd.cclose)
