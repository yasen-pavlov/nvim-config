require('null-ls').setup()
require('mason-null-ls').setup({
	ensure_installed = {
		'black',
		'prettierd',
		'stylua',
		'js-debug-adapter',
		'debugpy',
		'codelldb',
		'delve',
		'golangci_lint',
		'shfmt',
	},
	handlers = {},
})
