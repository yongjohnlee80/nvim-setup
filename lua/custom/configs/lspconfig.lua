local base_config = require("plugins.configs.lspconfig")
local on_attach = base_config.on_attach
local capabilities = base_config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
-- 	callback = function(event)
-- 		local map = function(keys, func, desc, mode)
-- 			mode = mode or 'n'
-- 			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
-- 		end
--
-- 		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
-- 		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
-- 		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
-- 		map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
-- 		map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
-- 		map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
-- 		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
-- 		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
-- 		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--
-- 		local client = vim.lsp.get_client_by_id(event.data.client_id)
-- 		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
-- 			local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
-- 			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
-- 				buffer = event.buf,
-- 				group = highlight_augroup,
-- 				callback = vim.lsp.buf.document_highlight,
-- 			})
--
-- 			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
-- 				buffer = event.buf,
-- 				group = highlight_augroup,
-- 				callback = vim.lsp.buf.clear_references,
-- 			})
--
-- 			vim.api.nvim_create_autocmd('LspDetach', {
-- 				group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
-- 				callback = function(event2)
-- 					vim.lsp.buf.clear_references()
-- 					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })

-- C & C++ lspconfig
lspconfig.clangd.setup {
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
}

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}
