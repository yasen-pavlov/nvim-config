require('lsp').setup()
require('mason').setup()
require('neodev').setup()

-- setup mason-lspconfig
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local schemastore = require('schemastore')

mason_lspconfig.setup({
	ensure_installed = { 'lua_ls', 'jsonls', 'yamlls' },
})

mason_lspconfig.setup_handlers({

	-- default handler
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = cmp_capabilities,
		})
	end,

	['lua_ls'] = function()
		lspconfig.lua_ls.setup({
			capabilities = cmp_capabilities,
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,
		})
	end,

	['jsonls'] = function()
		lspconfig.jsonls.setup({
			capabilities = cmp_capabilities,
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,

	['yamlls'] = function()
		lspconfig.yamlls.setup({
			capabilities = cmp_capabilities,
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
					},
					schemas = require('schemastore').yaml.schemas(),
				},
			},
		})
	end,
})

local null_ls = require('null-ls')
null_ls.setup()

-- setup mason-null-ls
require('mason-null-ls').setup({
	ensure_installed = { 'stylua' },
	handlers = {},
})