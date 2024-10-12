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

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require('dap-go').debug_test()
			end,
			"Debug go test"
		},
		["<Leader>dgl"] = {
			function()
				require('dap-go').debug_last()
			end,
			"Debug last go test",
		}
	}
}

return M
