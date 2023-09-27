--lsp configuration
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	settings = {
		Lua = {
			hint = {
				enable = false,
			},
		},
	},
})

-- neodev setup
require('neodev').setup({
	library = { plugins = { 'nvim-dap-ui' }, types = true },
})

-- dap configuration
local dap = require('dap')

dap.configurations.lua = {
	{
		type = 'nlua',
		request = 'attach',
		name = 'Attach to running Neovim instance',
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
end
