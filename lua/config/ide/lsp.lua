local mappings = require('user.keymaps').lsp

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

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.HINT] = '',
			[vim.diagnostic.severity.INFO] = '',
		},
	},
})

-- setup LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local bufnr = event.buf
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		local wk = require('which-key')

		wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))
		require('lsp-format').on_attach(client, bufnr)

		if not vim.lsp.inlay_hint.is_enabled() then
			vim.lsp.inlay_hint.enable(true)
		end

		-- server-specific tweaks
		if client.name == 'vtsls' then
      local ts_mappings = require('user.keymaps').languages.typescript
		  wk.add(vim.list_extend(ts_mappings, { { buffer = bufnr } }))

			vim.lsp.commands['editor.action.showReferences'] = function(command, ctx)
				local locations = command.arguments[3]
				if locations and #locations > 0 then
					local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
					vim.fn.setloclist(0, {}, ' ', { title = 'References', items = items, context = ctx })
					vim.cmd.lopen()
				end
			end
		end
	end,
})

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'
