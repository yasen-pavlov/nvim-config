require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		python = { 'black' },
		sh = { 'shfmt' },
		bash = { 'shfmt' },
		javascript = { 'prettierd' },
		javascriptreact = { 'prettierd' },
		typescript = { 'prettierd' },
		typescriptreact = { 'prettierd' },
		json = { 'prettierd' },
		jsonc = { 'prettierd' },
		yaml = { 'prettierd' },
		css = { 'prettierd' },
		scss = { 'prettierd' },
		html = { 'prettierd' },
		markdown = { 'prettierd' },
		go = { 'goimports', 'gofmt' },
	},
	format_on_save = {
		lsp_format = 'fallback',
		timeout_ms = 1500,
	},
})
