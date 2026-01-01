return {
    "nvim-treesitter/nvim-treesitter",
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
            "nix",
            "python",
            "rust",
            "typescript",
            "svelte",
            "sql",
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
