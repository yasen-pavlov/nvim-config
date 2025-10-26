vim.lsp.config('vtsls', {
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = 'always' },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = 'literals' },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = 'always' },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = 'literals' },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
})
vim.lsp.enable('vtsls')

local function get_js_debug()
	return vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'
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
