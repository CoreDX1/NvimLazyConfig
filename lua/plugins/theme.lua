local ok_status, NeoSolarized = pcall(require, "NeoSolarized")
if not ok_status then
	return
end

NeoSolarized.setup({
	style = "dark",
	transparent = true,
	terminal_colors = true,
	enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
	styles = {
		-- Style for different style groups
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		string = { italic = true },
		underline = true, -- true/false; for global underline
		undercurl = true, -- true/false; for global undercurl
	},
})

-- Ejecutar el comando:
vim.cmd([[colorscheme NeoSolarized]])
