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

require("lazy").setup { spec = "plugins" }
	-- {
	-- 	"nvim-telescope/telescope.nvim", tag = "0.1.6",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	build = function()
	-- 		require('nvim-treesitter.install').update({ with_sync = true })()
	-- 	end,
	-- 	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	-- },
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"williamboman/mason-lspconfig.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-cmdline",
	-- 		"hrsh7th/nvim-cmp",
	-- 		"L3MON4D3/LuaSnip",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"j-hui/fidget.nvim",
	-- 	},
	-- },
	-- "lewis6991/gitsigns.nvim",

	-- "tpope/vim-surround",
	-- "tpope/vim-commentary",

	-- "blaqbern/eclectic-vim",
	-- "blaqbern/amaro-vim", 
-- })
