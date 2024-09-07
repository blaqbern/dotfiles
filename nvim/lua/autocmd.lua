vim.api.nvim_create_augroup("go_ideosyncracies", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Go",
  callback = function ()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = false
  end,
})
