local lsp = require('lsp-zero')

lsp.ensure_installed({
	'lua_ls',
	'bashls',
	'jsonls',
	'yamlls',
})

lsp.set_sign_icons({
	error = '',
	warn = '',
	hint = '',
	info = '',
})

lsp.on_attach(function(_, bufnr)
	local wk = require('which-key')
	local opts = { buffer = bufnr, remap = false }

	wk.register({
		g = {
			D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
			d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
			i = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
			l = { '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostic' },
			r = { '<Cmd>Telescope lsp_references<CR>', 'Show references' },
		},
		K = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Show hover info' },
		['[d'] = { '<Cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic' },
		[']d'] = { '<Cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic' },
		['<leader>l'] = {
			a = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Select code action' },
			r = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename all references' },
			f = { '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', 'Format buffer' },
			s = { '<Cmd>Telescope lsp_workspace_symbols<CR>', 'Show workspace symbols' },
		},
	}, opts)

	lsp.buffer_autoformat()
end)

-- lsp servers configuration
local lspconfig = require('lspconfig')

--disable lua_ls formatter
lspconfig.lua_ls.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
})

-- use schemastore for jsonls
lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require('schemastore').json.schemas(),
			validate = { enable = true },
		},
	},
})

-- use schemastore for yamlls
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
			},
			schemas = require('schemastore').yaml.schemas(),
		},
	},
})

-- make bash-lsp work with zsh (nvim builtin-lsp)
lspconfig.bashls.setup({
	filetypes = { 'sh', 'zsh', 'bash' },
})

require('mason.settings').set({
	ui = {
		border = 'rounded',
	},
})

-- null-ls configuration
require('null-ls').setup()
require('mason-null-ls').setup({
	ensure_installed = { 'stylua' },
	handlers = {},
})

-- neodev setup
require('neodev').setup()

lsp.setup()
