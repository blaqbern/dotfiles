return {
	"nvim-lualine/lualine.nvim",
	config = function ()
		require("lualine").setup {
			options = {
				icons_enabled = false,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_divide_middle = false,
			},
			inactive_sections = {},
			sections = {
				lualine_a = {
					{
						"buffers",
						show_filename_only = false,
						show_modified_status = true,
						mode = 0,
						buffers_color = {
							active = "TablineSel",
							inactive = "Tabline",
						},
						symbols = {
							modified = " ⊙",
							alternate_file = "",
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"filename",
						file_status = true,
						color = "Operator",
						symbols = {
							modified = "⊙",
							readonly = "∅",
							unnamed = "-",
						},
					},
					{
						"location",
						color = "Operator",
					},
				},
			},
		}
	end,
}
