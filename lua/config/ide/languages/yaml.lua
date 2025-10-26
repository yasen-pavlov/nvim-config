vim.lsp.config('yamlls', {
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
