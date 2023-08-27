require('typescript-tools').setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false

		local wk = require('which-key')
		local opts = { buffer = bufnr, remap = false }

		wk.register({
			['<leader>t'] = {
				name = 'Typescript',
				i = { '<Cmd>TSToolsOrganizeImports<CR>', 'Sort and organize imports' },
				s = { '<Cmd>TSToolsSortImports<CR>', 'Sort imports' },
				r = { '<Cmd>TSToolsRemoveUnusedImports<CR>', 'Remove unused imports' },
				R = { '<Cmd>TSToolsRemoveUnused<CR>', 'Remove all unused statements' },
				m = { '<Cmd>TSToolsAddMissingImports<CR>', 'Add missing imports' },
				a = { '<Cmd>TSToolsFixAll<CR>', 'Fix all fixable errors' },
				g = { '<Cmd>TSToolsGoToSourceDefinition<CR>', 'Go to source definition' },
			},
		}, opts)
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

-- dap configuration
require('dap-vscode-js').setup({
	node_path = '/opt/homebrew/opt/node/bin/node',
	debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
	adapters = { 'pwa-node', 'pwa-chrome' },
})

local js_based_languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

for _, language in ipairs(js_based_languages) do
	require('dap').configurations[language] = {
		{
			type = 'pwa-chrome',
			request = 'launch',
			name = 'Start Chrome with "localhost"',
			url = 'http://localhost:3000',
			webRoot = '${workspaceFolder}',
			userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch file in node',
			program = '${file}',
			cwd = '${workspaceFolder}',
		},
		{
			type = 'pwa-node',
			request = 'attach',
			name = 'Attach file to node',
			processId = require('dap.utils').pick_process,
			cwd = '${workspaceFolder}',
		},
	}
end
