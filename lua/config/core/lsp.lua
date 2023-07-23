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
		['[d'] = { '<Cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic' },
		[']d'] = { '<Cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic' },
		['<leader>l'] = {
			a = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Select code action' },
			r = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename all references' },
			f = { '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', 'Format buffer' },
			s = { '<Cmd>Telescope lsp_workspace_symbols<CR>', 'Show workspace symbols' },
			h = { '<Cmd>lua require("lsp-inlayhints").toggle()<CR>', 'Toggle inlay hints' },
		},
		['<leader>r'] = {
			name = 'Rust commands',
			a = { '<Cmd>RustHoverActions<CR>', 'Hover actions' },
			r = { '<Cmd>RustRunnables<CR>', 'Run' },
			d = { '<Cmd>RustDebuggables<CR>', 'Debug' },
			c = { '<Cmd>RustOpenCargo<CR>', 'Open cargo' },
		},
	}, opts)

	-- autoformat on save
	lsp.buffer_autoformat()

	-- enable inlay hints
	require('lsp-inlayhints').on_attach(client, bufnr)
end)

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'

-- setup inlay hints
require('lsp-inlayhints').setup({
	inlay_hints = {
		highlight = 'Comment',
	},
	enabled_at_startup = true,
})

-- lsp servers configuration
local lspconfig = require('lspconfig')

--disable lua_ls formatter
lspconfig.lua_ls.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
		},
	},
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

lspconfig.pylsp.setup({
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
})

-- mason configuration --
require('mason.settings').set({
	ui = {
		border = 'rounded',
	},
})

-- null-ls configuration
require('null-ls').setup()
require('mason-null-ls').setup({
	ensure_installed = {
		'black',
		'prettierd',
		'stylua',
		'js-debug-adapter',
		'debugpy',
		'codelldb',
	},
	handlers = {},
})

-- neodev setup
require('neodev').setup({
	library = { plugins = { 'nvim-dap-ui' }, types = true },
})

-- setup code actions lightbulb
require('nvim-lightbulb').setup({
	autocmd = { enabled = true },
	sign = {
		enabled = false,
	},
	virtual_text = {
		enabled = true,
	},
})

lsp.skip_server_setup({ 'rust_analyzer', 'tsserver' })

lsp.setup()

-- configure rust tools
local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local rust_tools = require('rust-tools')
rust_tools.setup({
	tools = {
		inlay_hints = {
			auto = false,
		},
	},
	dap = {
		adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})

require('typescript-tools').setup({
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end,
	settings = {
		tsserver_file_preferences = {
			includeInlayParameterNameHints = 'all',
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})
