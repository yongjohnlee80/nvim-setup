local dap = require "dap"

---------------------------------------------------------
-- C, C++ & Rust DAP setup
-- IMPORTANT: Comment out codelldb configurations when
-- working on a rust project.
-- rustacean.nvim plugin automatically configures the
-- adapter for the debugging.
---------------------------------------------------------
-- INFO: execute codelldb --port 13000 on the background.
-- dap.adapters.codelldb = {
-- 	type = "server",
-- 	host = "127.0.0.1",
-- 	port = 13000,
-- 	executable = {
-- 		command = "codelldb",
-- 		args = { "--port", "${port}" },
-- 	},
-- }

dap.configurations.c = {
	type = "codelldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	end,
	--program = '${fileDirname}/${fileBasenameNoExtension}',
	cwd = "${workspaceFolder}",
	terminal = "integrated",
}

dap.configurations.cpp = dap.configurations.c

----------------------------------------------------------
-- Typescript
----------------------------------------------------------
dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = 8123,
	executable = {
		command = "js-debug-adapter",
	},
}

for _, language in ipairs { "typescript", "javascript" } do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
end
