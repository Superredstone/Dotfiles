local theme_config_file = "";

if vim.fn.has("win32") == 1 then
	theme_config_file = vim.env.HOME .. "\\AppData\\Local\\nvim\\lua\\config\\colorscheme.lua"
else
	theme_config_file = "~/.config/nvim/lua/custom/colorscheme.lua"
end

require("themery").setup({
	themes = {
		{
			name = "Onedark",
			colorscheme = "onedark"
		},
		{
			name = "Gruvbox",
			colorscheme = "gruvbox"
		},
		{
			name = "Tokyonight",
			colorscheme = "tokyonight"
		},
		{
			name = "Rose pine",
			colorscheme = "rose-pine"
		},
		{
			name = "Catppuccin Mocha",
			colorscheme = "catppuccin-mocha"
		},
		{
			name = "Catppuccin Macchiato",
			colorscheme = "catppuccin-macchiato"
		}
	},
	livePreview = true,
	themeConfigFile = theme_config_file
})

-- Default colorscheme
vim.cmd([[colorscheme onedark]])

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme catppuccin-macchiato")
vim.g.theme_id = 6
-- end themery block
