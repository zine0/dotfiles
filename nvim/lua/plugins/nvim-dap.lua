return {
	"mfussenegger/nvim-dap",
    lazy = true,
	config = function()
		local dap = require("dap")
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode",
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Lauch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				runInTerminal = true,
			},
		}
		dap.configurations.c = dap.configurations.cpp
	end,
}
