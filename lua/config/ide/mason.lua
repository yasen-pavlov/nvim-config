local lsp_zero = require('lsp-zero')

require('mason.settings').set({
	ui = {
		border = 'rounded',
	},
})

-- load language specific configurations
local config_ls = function(name)
	return function()
		require('config.ide.languages.' .. name)
	end
end

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'emmet_language_server',
		'eslint',
		'jsonls',
		'lua_ls',
		'pylsp',
		'rust_analyzer',
		'tsserver',
		'yamlls',
		'cssls',
		'cssmodules_ls',
		'clangd',
		'gopls',
		'vtsls',
	},
	handlers = {
		lsp_zero.default_setup,
		tsserver = lsp_zero.noop,
		rust_analyzer = lsp_zero.noop,
		bashls = config_ls('bash'),
		cssls = config_ls('css'),
		jsonls = config_ls('json'),
		lua_ls = config_ls('lua'),
		pylsp = config_ls('python'),
		yamlls = config_ls('yaml'),
	},
})
