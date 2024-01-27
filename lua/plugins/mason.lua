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
                "shfmt",
                -- c, c++
                "clangd",
                -- css
                "css-lsp",
                -- docker
                -- "dockerfile-language-server",
                -- "docker-compose-language-service",
                -- html
                "html-lsp",
                -- javascript, typescript
                -- "typescript-language-server",
                -- lua
                "lua-language-server",
                -- nix
                -- "nil",
                -- python
                "pyright",
                "pydocstyle",
                "black",
                -- ruby
                -- "ruby-lsp",
                -- rust
                "rust-analyzer",
                "codelldb",
                -- sql
                -- "sqlls",
            },
            auto_update = true,
        })
    end,
}
