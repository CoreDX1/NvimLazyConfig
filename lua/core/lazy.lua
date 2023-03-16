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
	"navarasu/onedark.nvim",
	--AutoCompletado
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		priority = 1000,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",

	-- AutoCompletado por IA
	{
		"Exafunction/codeium.vim",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	-- Lps for nvim-cmp
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

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
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},
	-- lua Snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

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
                    csharp = "dotnet run"
				},
			})
		end,
	},
})
