local status, cmp = pcall(require, "cmp")
if not status then
	return
end

require("cmp").setup({
	sources = {
		{ name = "path" },
	},
})

local source_mapping = {
	nvim_lsp = "[LSP]",
	path = "[Path]",
	buffer = "[Buffer]",
	nvim_lua = "[Lua]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
		entry_filter = function(entry, ctx)
			local kind = types.lsp.CompletionItemKind[entry:get_kind()]
			if kind == "Text" then
				return false
			end
			return true
		end,
	}),
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
