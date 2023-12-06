require('null-ls').setup()
require('mason-null-ls').setup({
	ensure_installed = {
		'black',
		'prettierd',
		'stylua',
		'js-debug-adapter',
		'debugpy',
		'codelldb',
		'beautysh',
		'delve',
		'golangci_lint',
	},
	handlers = {},
})
