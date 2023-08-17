local lsp = require('lsp-zero')

lsp.ensure_installed({
	'bashls',
	'emmet_language_server',
	'eslint',
	'jsonls',
	'lua_ls',
	'pylsp',
	'rust_analyzer',
	'tsserver',
	'yamlls',
	'cssls',
	'cssmodules_ls',
})

lsp.set_sign_icons({
	error = '',
	warn = '',
	hint = '',
	info = '',
})

lsp.on_attach(function(client, bufnr)
	-- configure mappings
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
		['<C-a>'] = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Select code action' },
		['[d'] = { '<Cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic' },
		[']d'] = { '<Cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic' },
		['<leader>l'] = {
			r = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename all references' },
			f = { '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', 'Format buffer' },
			s = { '<Cmd>Telescope lsp_workspace_symbols<CR>', 'Show workspace symbols' },
			h = { '<Cmd>lua require("lsp-inlayhints").toggle()<CR>', 'Toggle inlay hints' },
		},
	}, opts)

	-- autoformat on save
	lsp.buffer_autoformat()

	-- enable inlay hints
	require('lsp-inlayhints').on_attach(client, bufnr)
end)

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'

-- load language specific configurations
local config_ls = function(name)
	require('config.ide.languages.' .. name)
end

config_ls('bash')
config_ls('json')
config_ls('lua')
config_ls('python')
config_ls('yaml')
config_ls('css')

-- disable language servers that have their own plugins
lsp.skip_server_setup({ 'rust_analyzer', 'tsserver' })

lsp.setup()
