vim.lsp.config('tailwindcss', {
	filetypes = {
		'html',
		'css',
		'scss',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'svelte',
		'vue',
	},
})
vim.lsp.enable('tailwindcss')
