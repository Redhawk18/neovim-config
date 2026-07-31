return {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
        {
            "<leader>gv",
            function()
                if next(require("diffview.lib").views) == nil then
                    vim.cmd("DiffviewOpen")
                else
                    vim.cmd("DiffviewClose")
                end
            end,
            desc = "Toggle diffview",
        },
        {
            "<leader>gm",
            function()
                -- resolve the repo's default branch (main/master) from origin/HEAD
                local head = vim.fn.system("git rev-parse --abbrev-ref origin/HEAD 2>/dev/null")
                local base = head:gsub("%s+", "")
                if base == "" then
                    base = "origin/main"
                end
                vim.cmd("DiffviewOpen " .. base .. "...HEAD")
            end,
            desc = "Diffview vs default branch (PR diff)",
        },
        { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview branch history" },
        { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview current file history" },
    },
    config = function()
        require("diffview").setup()
    end,
}
