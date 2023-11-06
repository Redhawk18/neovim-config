return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "gruvbox_dark",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1
					},
				},

				lualine_x = {
					{
					lazy_status.updates,
					cond = lazy_status.has_updates,
					}
				},
			},
		})
	end,
}
