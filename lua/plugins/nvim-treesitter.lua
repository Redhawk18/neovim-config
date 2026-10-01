return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- "main" is a rewrite that requires Neovim 0.12+
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "css",
            "dockerfile",
            "html",
            "java",
            "javascript",
            "lua",
            "markdown",
            "markdown_inline",
            "nix",
            "python",
            "rust",
            "typescript",
            "svelte",
            "sql",
            "query",
            "vim",
            "vimdoc",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        local status, configs = pcall(require, "nvim-treesitter.configs")
        if status then
            configs.setup(opts)
        else
        end
    end,
}
