return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- bash
				"bash-language-server",
				"bash-debug-adapter",
				"beautysh",
				-- c, c++
				"clangd",
				"cpplint",
				"clang-format",
				-- css
				"css-lsp",
				-- docker
				"dockerfile-language-server",
				"docker-compose-language-service",
				-- html
				"html-lsp",
				-- javascript, typescript
				"typescript-language-server",
				"ts-standard",
				-- lua
				"lua-language-server",
				"luacheck",
				"luaformatter",
				-- nix
				"nil",
				-- python
				"pyright",
				"mypy",
				"pydocstyle",
				"black",
				-- ruby
				"ruby-lsp",
				"erb-lint",
				"rubyfmt",
				-- rust
				"rust-analyzer",
				"codelldb",
				-- sql
				"sqlls",
				"sqlfluff",
				"sqlfmt",
			},
			auto_update = true,
		})
	end,
}

