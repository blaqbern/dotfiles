return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	build = function()
		pcall(require('nvim-treesitter.install').update({ with_sync = true }))
	end,

	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"go", "lua", "ocaml","typescript", "bash", "markdown",
				"terraform", "yaml", "json", "toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			sync_install = false,
			auto_install = true,
		}
	end,
}
