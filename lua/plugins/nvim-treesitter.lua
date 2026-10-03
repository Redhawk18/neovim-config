-- The "main" branch is a full rewrite requiring Neovim 0.12+; "master" is
-- locked to Neovim 0.10/0.11 and crashes on 0.12 (its query directives assume
-- a single node per capture, while 0.12 passes a list).
local languages = {
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
}

if vim.fn.has("nvim-0.12") == 1 then
    return {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false, -- "main" does not support lazy-loading
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })
            treesitter.install(languages)

            -- "main" ships no modules: highlighting and indentation are enabled
            -- per buffer against whatever parser is actually installed.
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_start", {}),
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                    if not lang or not vim.treesitter.language.add(lang) then
                        return
                    end

                    vim.treesitter.start(args.buf, lang)
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    }
end

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    opts = {
        ensure_installed = languages,
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
        end
    end,
}
