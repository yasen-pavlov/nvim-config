require('go').setup({
	lsp_cfg = false,
	lsp_gofumpt = true,
	lsp_on_attach = function(_, bufnr)
		local wk = require('which-key')
		local opts = { buffer = bufnr, remap = false }

		wk.register({
			['<leader>o'] = {
				name = 'Go',
				r = { '<Cmd>GoRun<CR>', 'Run' },
				d = { '<Cmd>GoDebug<CR>', 'Debug' },
				c = { '<Cmd>GoCodeLenAct<CR>', 'Codelens' },
			},
		}, opts)
	end,
	trouble = true,
	luasnip = true,
})
local cfg = require('go.lsp').config() -- config() return the go.nvim gopls setup

require('lspconfig').gopls.setup(cfg)
