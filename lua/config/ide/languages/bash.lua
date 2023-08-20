require('lspconfig').bashls.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
})
