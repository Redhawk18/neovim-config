return {
	-- "rebelot/kanagawa.nvim", -- https://github.com/rebelot/kanagawa.nvim
	"ellisonleao/gruvbox.nvim", -- https://github.com/ellisonleao/gruvbox.nvim
	priority = 1000,
	config = function()
		-- kanagawa
		--vim.cmd("colorscheme kanagawa-wave")

		-- gruvbox 
		vim.cmd("colorscheme gruvbox")
	end
}

