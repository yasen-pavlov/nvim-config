require('mason-tool-installer').setup({
	ensure_installed = {
		-- formatters
		'black',
		'prettierd',
		'stylua',
		'shfmt',
		'goimports',

		-- linters
		'golangci-lint',

		-- DAP adapters
		'js-debug-adapter',
		'debugpy',
		'codelldb',
		'delve',
	},
	auto_update = false,
	run_on_start = true,
})
