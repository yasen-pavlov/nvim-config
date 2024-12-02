require('lspconfig').clangd.setup({
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'arduino' },
	init_options = {
		fallbackFlags = { '--std=c2x' },
	},
})
require('clangd_extensions').setup({
	ast = {
		role_icons = {
			type = '',
			declaration = '',
			expression = '',
			specifier = '',
			statement = '',
			['template argument'] = '',
		},

		kind_icons = {
			Compound = '',
			Recovery = '',
			TranslationUnit = '',
			PackExpansion = '',
			TemplateTypeParm = '',
			TemplateTemplateParm = '',
			TemplateParamObject = '',
		},
	},
})

local inlay_hints = require('clangd_extensions.inlay_hints')
inlay_hints.setup_autocmd()
inlay_hints.set_inlay_hints()
