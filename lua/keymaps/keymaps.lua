local Utils = require("keymaps.utils")
vim.g.mapleader = " " -- Use space as leader key
local map = Utils.noremap

local MayKey = {
	["n"] = {
		["<leader>w"] = "w",
		-- Telescope
		["<leader>ff"] = "Telescope find_files",
		["<leader>fg"] = "Telescope live_grep",
		["<leader>ft"] = "lua require('telescope.builtin').current_buffer_fuzzy_find()",
		["<leader>e"] = "NvimTreeToggle",
		["<leader>fb"] = "lua require('buffer_manager.ui').toggle_quick_menu()",
		-- LSP
		["<leader>la"] = "lua vim.lsp.buf.code_action()",
		["<leader>lr"] = "lua vim.lsp.buf.rename()",
		["<leader>ld"] = "lua vim.lsp.buf.definition()",
		["<leader>lw"] = "Telescope diagnostics",
        -- Smart Splits
        ["<C-h>"] = "SmartCursorMoveLeft",
        ["<C-j>"] = "SmartCursorMoveDown",
        ["<C-k>"] = "SmartCursorMoveUp",
        ["<C-l>"] = "SmartCursorMoveRight",
	},
}

for mode, mappings in pairs(MayKey) do
	for k, v in pairs(mappings) do
		map(mode, k, "<Cmd>" .. v .. "<CR>")
	end
end
