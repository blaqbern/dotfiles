return {
	SetTheme = function(cs)
		vim.cmd.colorscheme(cs or "amaro")
	end,
}
