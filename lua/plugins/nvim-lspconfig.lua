return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "Go to declaration"
            keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "<leader>ldf", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "<leader>ltd", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<F3>", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Smart rename"
            keymap.set("n", "<F2>", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<F5>", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<F6>", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "<F7>", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "<F8>", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "<leader>doc", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local nproc = string.gsub(vim.fn.system('nproc'), "\n", "")

        lspconfig["bashls"].setup({})

        -- c, c++, objc
        lspconfig["clangd"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--header-insertion=never",
                "-j", nproc,
                "--background-index",
            },
            filetypes = { "c", "cpp", },
        })

        lspconfig["cssls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["dockerls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["docker_compose_language_service"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["html"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- java
        lspconfig["jdtls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { 'jdtls' }
        })


        -- javascript, typescript
        lspconfig["tsserver"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- lua
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "lua-lsp" },
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },

        })

        lspconfig["nixd"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            formating = {
                command = { "nixpkgs-fmt" },
            },
        })

        -- nix
        -- lspconfig["nil_ls"].setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     formating = {
        --         command = { "nixpkgs-fmt" },
        --     },
        -- })

        -- python
        lspconfig["pyright"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            procMacro = {
                ignored = {
                    leptos_macro = {
                        -- optional: --
                        -- "component",
                        "server",
                    },
                },
            },
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
        })

        lspconfig["svelte"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        lspconfig["sqlls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
}
