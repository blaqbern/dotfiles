function SetColors(colorscheme)
	colorscheme = colorscheme or "amaro"
	vim.cmd.colorscheme(colorscheme)
end

SetColors()
