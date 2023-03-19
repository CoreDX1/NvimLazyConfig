require("code_runner").setup({
	-- put here the commands by filetype
	mode = "toggle",
	term = {
		position = "bot",
		size = 5,
	},
	filetype = {
		csharp = "dotnet run",
	},
})
