local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install Lazy if not installed
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

local plugins = {
	-- Colorscheme
	"zaldih/themery.nvim",
	"navarasu/onedark.nvim",
	"ellisonleao/gruvbox.nvim",
	"folke/tokyonight.nvim",
	"rose-pine/neovim",

	-- Status bar
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",

	-- Git integration
	"lewis6991/gitsigns.nvim",

	-- File tree
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",

	-- Fuzzy finder
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",

	-- Auto commenter
	"terrortylor/nvim-comment",

	-- Auto close parenthesis
	"m4xshen/autoclose.nvim",

	-- Better terminal
	"akinsho/toggleterm.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Copilot
	"github/copilot.vim",

	-- LSP + cmp
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{ "williamboman/mason.nvim", config = true },
	"williamboman/mason-lspconfig.nvim",
}

require("lazy").setup(plugins)

-- Setup plugins
require("lualine").setup()
require("bufferline").setup()
require("gitsigns").setup()
require("nvim-tree").setup()
require("nvim_comment").setup()
require("autoclose").setup({
	options = {
		disabled_filetypes = { "text", "markdown" },
	}
})
