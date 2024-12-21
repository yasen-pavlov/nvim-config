local blink = require('blink.cmp')

require('luasnip.loaders.from_vscode').lazy_load()

blink.setup({
	completion = {
		menu = {
			border = 'rounded',
		},
		documentation = {
			window = {
				border = 'rounded',
			},
		},
	},
	snippets = {
		expand = function(snippet)
			require('luasnip').lsp_expand(snippet)
		end,
		active = function(filter)
			if filter and filter.direction then
				return require('luasnip').jumpable(filter.direction)
			end
			return require('luasnip').in_snippet()
		end,
		jump = function(direction)
			require('luasnip').jump(direction)
		end,
	},
	sources = {
		default = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev' },
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
