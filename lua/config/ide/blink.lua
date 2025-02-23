local blink = require('blink.cmp')

require('luasnip.loaders.from_vscode').lazy_load()

blink.setup({
	appearance = {
		use_nvim_cmp_as_default = true,
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		menu = {
			border = 'rounded',
			draw = {
				columns = { { 'kind_icon' }, { 'label', gap = 1 } },
				components = {
					kind_icon = {
						text = function(item)
							local kind = require('lspkind').symbol_map[item.kind] or ''
							return kind .. ' '
						end,
					},
					label = {
						text = function(ctx)
							return require('colorful-menu').blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require('colorful-menu').blink_components_highlight(ctx)
						end,
					},
				},
			},
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
