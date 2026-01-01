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


        -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		vim.keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint <CR>")
		vim.keymap.set("n", "<F5>", "<cmd>DapContinue <CR>")
	end,
}
