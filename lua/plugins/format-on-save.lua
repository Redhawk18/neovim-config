return {
    "elentok/format-on-save.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
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
                c = formatters.lsp,
                cpp = formatters.lsp,
                css = formatters.lsp,
                dockerfile = formatters.lsp,
                html = formatters.lsp,
                javascript = formatters.prettierd,
                lua = formatters.lsp,
                nix = formatters.lsp,
                python = formatters.black,
                rust = formatters.lsp,
                sh = formatters.shfmt,
                svelte = formatters.lsp,
                sql = formatters.lsp,
                typescript = formatters.prettierd,
            },
        })
    end,

}
