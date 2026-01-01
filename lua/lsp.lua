-- Add via module name in lsp/ not the lsp server's name.
local servers = {
	"clangd",
	"cmake",
	"docker-compose",
	"docker",
	"json",
	"just",
	"nixd",
	"pyright",
	"rust-analyzer",
	"svelte",
	"taplo",
	"typescript",
	"yaml",
}

for _, server in ipairs(servers) do
	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local config = require("lsp." .. server)

			vim.lsp.start({
				name = server,
				cmd = config.cmd,
				root_dir = vim.fs.root(args.buf, config.root_markers),
			})
		end,
	})
end
