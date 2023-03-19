local function lsp_settings()
	local sign = function(opts)
		vim.fn.sign_define(opts.name, {
			texthl = opts.name,
			text = opts.text,
			numhl = "",
		})
	end

	sign({ name = "DiagnosticSignError", text = "✘" })
	sign({ name = "DiagnosticSignWarn", text = "▲" })
	sign({ name = "DiagnosticSignHint", text = "⚑" })
	sign({ name = "DiagnosticSignInfo", text = "" })

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	local command = vim.api.nvim_create_user_command

	command("LspWorkspaceAdd", function()
		vim.lsp.buf.add_workspace_folder()
	end, { desc = "Add folder to workspace" })

	command("LspWorkspaceList", function()
		vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = "List workspace folders" })

	command("LspWorkspaceRemove", function()
		vim.lsp.buf.remove_workspace_folder()
	end, { desc = "Remove folder from workspace" })
end

local function lsp_attach(client, bufnr)
	local buf_command = vim.api.nvim_buf_create_user_command

	buf_command(bufnr, "LspFormat", function()
		vim.lsp.buf.format()
	end, { desc = "Format buffer with language server" })
end

lsp_settings()

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
