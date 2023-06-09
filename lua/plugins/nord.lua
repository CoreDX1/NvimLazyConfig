require("nord").setup({
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
	borders = true, -- Enable the border between verticaly split windows visible
	errors = { mode = "bg" }, -- Display mode for errors and diagnostics
	-- values : [bg|fg|none]
	styles = {
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
		bufferline = {
			current = {},
			modified = { italic = true },
		},
	},

	colorblind = {
		enable = false,
		preserve_background = false,
		severity = {
			protan = 0.0,
			deutan = 0.0,
			tritan = 0.0,
		},
	},
})
