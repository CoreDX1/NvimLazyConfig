local Utils = require("keymaps.utils")
vim.g.mapleader = " " -- Use space as leader key
local map = Utils.noremap

local MayKey = {
	["n"] = {
		["<leader>w"] = "w",
        ["<leader>fn"] = "lua vim.lsp.buf.format()",
		-- Telescope
		["<leader>ff"] = "Telescope find_files",
		["<leader>fg"] = "Telescope live_grep",
		["<leader>ft"] = "lua require('telescope.builtin').current_buffer_fuzzy_find()",
		["<leader>e"] = "NvimTreeToggle",
		["<leader>fb"] = "lua require('buffer_manager.ui').toggle_quick_menu()",
		-- LSP
		["<leader>ld"] = "lua vim.lsp.buf.definition()",
		["<leader>lw"] = "Telescope diagnostics",
		["K"] = "lua vim.lsp.buf.hover()",
		["gd"] = "lua require('omnisharp_extended').lsp_definitions()",
		["gD"] = "lua vim.lsp.buf.declaration()",
		["gi"] = "lua vim.lsp.buf.implementation()",
		["go"] = "lua vim.lsp.buf.type_definition()",
		["gr"] = "lua vim.lsp.buf.references()",
		["<F2>"] = "lua vim.lsp.buf.rename()",
		["<F4>"] = "lua vim.lsp.buf.code_action()",
		-- diagnostics
		["gl"] = "lua vim.diagnostic.open_float()",
		["[d"] = "lua vim.diagnostic.goto_prev()",
		["]d"] = "lua vim.diagnostic.goto_next()",
		-- Smart Splits
		["<C-h>"] = "SmartCursorMoveLeft",
		["<C-j>"] = "SmartCursorMoveDown",
		["<C-k>"] = "SmartCursorMoveUp",
		["<C-l>"] = "SmartCursorMoveRight",
		-- Csharp
		["<leader>cs"] = "RunCode csharp",
        ["<leader>ct"] = "RunClose",

		-- Buffer Line
		["<S-h>"] = "BufferLineCyclePrev",
		["<S-l>"] = "BufferLineCycleNext",
		["<leader>x"] = "BufferLinePickClose",
	},
}

for mode, mappings in pairs(MayKey) do
	for k, v in pairs(mappings) do
		map(mode, k, "<Cmd>" .. v .. "<CR>")
	end
end
