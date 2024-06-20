require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.65,
			horizontal = {
				size = {
					width = "80%",
					height = "80%",
				},
			},
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>r", builtin.grep_string)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
