require('lsp-zero.cmp').extend({
	set_extra_mappings = true,
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'git' },
	},
	mapping = {
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = require('lspkind').cmp_format({
			mode = 'symbol_text',
			menu = {
				buffer = '[Buffer]',
				nvim_lsp = '[LSP]',
				luasnip = '[LuaSnip]',
				path = '[Path]',
				git = '[Git]',
			},
		}),
	},
})

require('cmp_git').setup()

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})
