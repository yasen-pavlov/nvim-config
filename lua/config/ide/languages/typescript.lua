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

local function get_js_debug()
	local install_path = require('mason-registry').get_package('js-debug-adapter'):get_install_path()
	return install_path .. '/js-debug/src/dapDebugServer.js'
end

for _, adapter in ipairs({ 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }) do
	require('dap').adapters[adapter] = {
		type = 'server',
		host = 'localhost',
		port = '${port}',
		executable = {
			command = 'node',
			args = {
				get_js_debug(),
				'${port}',
			},
		},
	}
end

for _, language in ipairs({ 'typescript', 'javascript' }) do
	require('dap').configurations[language] = {
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Launch file',
			program = '${file}',
			cwd = '${workspaceFolder}',
		},
		{
			type = 'pwa-node',
			request = 'attach',
			name = 'Attach',
			processId = require('dap.utils').pick_process,
			cwd = '${workspaceFolder}',
		},
		{
			type = 'pwa-node',
			request = 'launch',
			name = 'Debug Jest Tests',
			runtimeExecutable = 'node',
			runtimeArgs = {
				'./node_modules/jest/bin/jest.js',
				'--runInBand',
			},
			rootPath = '${workspaceFolder}',
			cwd = '${workspaceFolder}',
			console = 'integratedTerminal',
			internalConsoleOptions = 'neverOpen',
		},
		{
			type = 'pwa-chrome',
			name = 'Attach - Remote Debugging',
			request = 'attach',
			program = '${file}',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = 'inspector',
			port = 9222,
			webRoot = '${workspaceFolder}',
		},
		{
			type = 'pwa-chrome',
			name = 'Launch Chrome',
			request = 'launch',
			url = 'http://localhost:5173',
			webRoot = '${workspaceFolder}',
			userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
		},
	}
end

for _, language in ipairs({ 'typescriptreact', 'javascriptreact' }) do
	require('dap').configurations[language] = {
		{
			type = 'pwa-chrome',
			name = 'Attach - Remote Debugging',
			request = 'attach',
			program = '${file}',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = 'inspector',
			port = 9222,
			webRoot = '${workspaceFolder}',
		},
		{
			type = 'pwa-chrome',
			name = 'Launch Chrome',
			request = 'launch',
			url = 'http://localhost:5173',
			webRoot = '${workspaceFolder}',
			userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
		},
	}
end
