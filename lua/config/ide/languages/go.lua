local mappings = require('user.keymaps').languages.go

require('go').setup({
	lsp_cfg = true,
	lsp_gofumpt = true,
	lsp_on_attach = function(_, bufnr)
		local wk = require('which-key')
		local opts = { buffer = bufnr, remap = false }

		wk.register(mappings, opts)
	end,
	trouble = true,
	luasnip = true,
})
local cfg = require('go.lsp').config()

require('lspconfig').gopls.setup(cfg)
