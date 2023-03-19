local lsp = require("lsp-zero")
lsp.preset({
	name = "minimal",
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})
lsp.setup_servers({
	"omnisharp",
})
lsp.configure("omnisharp", {
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
	},
})
lsp.nvim_workspace()
lsp.setup()
