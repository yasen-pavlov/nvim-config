local blink = require('blink.cmp')

require('luasnip.loaders.from_vscode').lazy_load()

blink.setup({
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		menu = {
			border = 'rounded',
		},
		documentation = {
			window = {
				border = 'rounded',
			},
		},
	},
	snippets = { preset = 'luasnip' },
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
		providers = {
			lazydev = {
				name = 'LazyDev',
				module = 'lazydev.integrations.blink',
				score_offset = 100,
			},
		},
	},
})

vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'Normal' })
