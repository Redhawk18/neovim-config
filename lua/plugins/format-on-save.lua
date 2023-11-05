return {
	"elentok/format-on-save.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
		local format_on_save = require("format-on-save")
		local formatters = require("format-on-save.formatters")

		format_on_save.setup({
			exclude_path_patterns = {
				".venv/",
				"build/",
				"node_modules/",
				"target/",
			},
			formatter_by_ft = {
				python = formatters.black

			},
		})
	end,

}
