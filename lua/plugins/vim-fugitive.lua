return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>ga', function() vim.cmd.Git("add " .. vim.fn.input("> ")) end)
        vim.keymap.set('n', '<leader>gaa', function() vim.cmd.Git("add *") end)
        vim.keymap.set('n', '<leader>gc', function() vim.cmd.Git('commit -m "' .. vim.fn.input("> ") .. '"') end)
        vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git("push") end)
        vim.keymap.set('n', '<leader>gpl', function() vim.cmd.Git("pull") end)
        vim.keymap.set('n', '<leader>gd', function() vim.cmd.Git("diff") end)
        vim.keymap.set('n', '<leader>gl', function() vim.cmd.Git("log") end)
    end,
}
