-- mason config
require('mason').setup({
	ui = {
		border = 'rounded',
		backdrop = 100,
	},
})

-- load language specific configurations
local config_ls = function(name)
	require('config.ide.languages.' .. name)
end

-- mason-lspconfig setup
require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'emmet_language_server',
		'eslint',
		'jsonls',
		'lua_ls',
		'pylsp',
		'rust_analyzer',
		'ts_ls',
		'yamlls',
		'cssls',
		'cssmodules_ls',
		'clangd',
		'gopls',
		'vtsls',
		'tailwindcss',
		'gh_actions_ls',
	},
	automatic_enable = {
		exclude = {
			'ts_ls',
			'rust_analyzer',
		},
	},
})

-- configure languages
config_ls('go')
config_ls('bash')
config_ls('css')
config_ls('json')
config_ls('lua')
config_ls('python')
config_ls('yaml')
