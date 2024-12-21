local mappings = require('user.keymaps').lsp
local lsp_zero = require('lsp-zero')

local ufo_capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

local lsp_capabilities = vim.tbl_deep_extend('force', require('blink.cmp').get_lsp_capabilities(), ufo_capabilities)
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, lsp_capabilities)

lsp_zero.set_sign_icons({
	error = '',
	warn = '',
	hint = '',
	info = '',
})

lsp_zero.on_attach(function(client, bufnr)
	-- configure mappings
	local wk = require('which-key')

	wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))

	-- autoformat on save
	lsp_zero.buffer_autoformat()

	-- navic
	if client.server_capabilities.documentSymbolProvider then
		require('nvim-navic').attach(client, bufnr)
	end

	-- enable inlay hints
	if client.supports_method('textDocument/inlayHint') or client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

	-- fix hover no information available
	vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
		config = config or { border = 'single' }
		config.focus_id = ctx.method
		if not (result and result.contents) then
			return
		end
		local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
		markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
		if vim.tbl_isempty(markdown_lines) then
			return
		end
		return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
	end
end)

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'
