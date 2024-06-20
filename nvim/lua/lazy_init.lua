local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

print(lazypath)
require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require('nvim-treesitter.install').update({ with_sync = true })()
		end,
		dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	},
	"lewis6991/gitsigns.nvim",

	"tpope/vim-surround",
	"tpope/vim-commentary",

	-- "fatih/vim-go",
	-- "pangloss/vim-javascript",
	-- "mxw/vim-jsx",
	-- "hashivim/vim-terraform",

	"blaqbern/eclectic-vim",
	"blaqbern/amaro-vim", 
})
