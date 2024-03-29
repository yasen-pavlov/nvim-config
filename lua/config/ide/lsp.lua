local mappings = require('user.keymaps').lsp
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

lsp_zero.set_sign_icons({
	error = '',
	warn = '',
	hint = '',
	info = '',
})

lsp_zero.on_attach(function(client, bufnr)
	-- configure mappings
	local wk = require('which-key')
	local opts = { buffer = bufnr, remap = false }

	wk.register(mappings, opts)

	-- autoformat on save
	lsp_zero.buffer_autoformat()

	-- enable inlay hints
	require('lsp-inlayhints').on_attach(client, bufnr)

	-- navic
	if client.server_capabilities.documentSymbolProvider then
		require('nvim-navic').attach(client, bufnr)
	end
end)

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'
