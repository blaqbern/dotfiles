vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 500

vim.opt.colorcolumn = { 80, 120 }
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  eol = "⌜",
  trail = "❢",
  tab = "⋮ "
}
