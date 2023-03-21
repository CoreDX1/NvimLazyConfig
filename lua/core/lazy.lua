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
				build = "make install_jsregexp",
			}, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},
	{
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		config = function()
			require("bufferline").setup({})
		end,
	},
	"Exafunction/codeium.vim", -- AutoCompletado por IA
	"nvim-treesitter/nvim-treesitter", -- Treesitter
	"nvim-lua/plenary.nvim", -- File explorer
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	},
	"m4xshen/autoclose.nvim", -- Auto Close
	"Tsuzat/NeoSolarized.nvim", -- Theme
	"kyazdani42/nvim-tree.lua", -- File Explorer
	"mrjones2014/smart-splits.nvim", -- Smart splits
	"CRAG666/code_runner.nvim", -- Code Runner
	"Hoffs/omnisharp-extended-lsp.nvim", -- LSP omnisharp integration
	"nvim-tree/nvim-web-devicons",
    "gbprod/nord.nvim"
})
