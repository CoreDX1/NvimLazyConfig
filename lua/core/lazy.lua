local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig", lazy = false, priority = 1000 }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			{ "hrsh7th/cmp-cmdline" },

			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				version = "<CurrentMajor>.*",
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			}, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},
	-- AutoCompletado por IA
	"Exafunction/codeium.vim",
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	-- File explorer
	{
		"j-morano/buffer_manager.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("buffer_manager").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	},
	"nvim-telescope/telescope-file-browser.nvim",

	-- Auto Close
	"m4xshen/autoclose.nvim",
	-- Theme
	"Tsuzat/NeoSolarized.nvim",
	-- File Explorer
	"kyazdani42/nvim-tree.lua",
	-- Smart splits
	"mrjones2014/smart-splits.nvim",
	-- Code Runner
	{
		"CRAG666/code_runner.nvim",
		config = function()
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
		end,
	},
	"Hoffs/omnisharp-extended-lsp.nvim",
})
