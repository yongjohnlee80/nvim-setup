local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line"
		},
		["<C-F8>"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line"
		},
		["<F8>"] = {
			"<cmd> DapStepOver <CR>",
			"Step Over",
		},
		["<F7>"] = {
			"<cmd> DapStepInto <CR>",
			"Step Into",
		},
		["<S-F8>"] = {
			"<cmd> DapStepOut <CR>",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger"
		},
		["<F9>"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger"
		}
	}
}

return M
