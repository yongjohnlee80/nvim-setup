local null_ls = require("null_ls")

null_ls.setup({
	sources = {
		require("none-ls.diagnostics.eslint_d"),
		null_ls.builtins.formatting.stylua, --lua
		null_ls.builtins.formatting.prettier, --javascript
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.spell,
		null_ls.builtins.formatting.black, --python
		null_ls.builtins.formatting.isort, --pytho
	},
})

-- vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
