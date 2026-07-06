return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui" },
	event = "VeryLazy",
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

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
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			},
		}

		local native_config = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = native_config
		dap.configurations.cpp = native_config
		dap.configurations.zig = native_config
		dap.configurations.d = native_config
		dap.configurations.nim = native_config
		dap.configurations.fortran = native_config

		vim.keymap.set("n", "<F9>", "<cmd>DapToggleBreakpoint <CR>")
		vim.keymap.set("n", "<F5>", "<cmd>DapContinue <CR>")
	end,
}
