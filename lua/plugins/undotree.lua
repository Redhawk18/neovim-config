return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<F4>', vim.cmd.UndotreeToggle)
    end,
}
