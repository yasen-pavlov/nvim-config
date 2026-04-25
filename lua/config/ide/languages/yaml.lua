vim.lsp.config('yamlls', {
	filetypes = { 'yaml' },
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
			},
			schemas = require('schemastore').yaml.schemas(),
		},
	},
})
vim.lsp.enable('yamlls')
