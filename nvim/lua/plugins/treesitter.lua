return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require('nvim-treesitter.install').update({ with_sync = true })()
	end,
	dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },

	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
				"go", "lua", "typescript", "bash", "markdown", "terraform",
				"yaml", "json", "toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			sync_install = false,
			auto_install = true,
		}
	end,
}
