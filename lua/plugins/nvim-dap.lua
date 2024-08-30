return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    event = "VeryLazy",
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            dapui.open()
        end

        vim.keymap.set("n", "<Leader>db", "<cmd>DapToggleBreakpoint <CR>")
        vim.keymap.set("n", "<Leader>dr", "<cmd>DapContinue <CR>")
    end,
}
