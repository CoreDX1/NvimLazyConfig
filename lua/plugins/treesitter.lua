local status, color = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

color.setup({
	-- A list of parser names, or "all"
	ensure_installed = { "http", "json" },

	sync_install = true,

	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "c" },
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
