require('illuminate').configure({
	providers = {
		'lsp',
		'treesitter',
	},
})

vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#303030' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = '#303030' })
vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { standout = true, bg = '#303030' })
