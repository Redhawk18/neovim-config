return {
    cmd = { 'lua-language-server' },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",  -- Modern lua_ls config file
        ".luarc.jsonc",
        ".stylua.toml", -- Stylua formatter config
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        "init.lua", -- Matches Neovim config roots
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
}
