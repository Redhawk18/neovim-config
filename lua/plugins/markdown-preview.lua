return {
    "iamcco/markdown-preview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}
