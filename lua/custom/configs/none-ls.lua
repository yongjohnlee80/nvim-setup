local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		require("none-ls.diagnostics.eslint_d"),
		null_ls.builtins.formatting.stylua, --lua
		null_ls.builtins.formatting.prettier, --javascript
		null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.formatting.spell,
		null_ls.builtins.formatting.black, --python
		null_ls.builtins.formatting.isort, --python
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({bufnr = bufnr})
				end,
			})
		end
	end,
})
