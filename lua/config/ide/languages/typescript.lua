local mappings = require('user.keymaps').languages.typescript

require('lspconfig').vtsls.setup({
	on_attach = function(_, bufnr)
		local wk = require('which-key')
		local opts = { buffer = bufnr, remap = false }

		wk.register(mappings, opts)
	end,
	settings = {
		typescript = {
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

-- handler for codelens  command
vim.lsp.commands['editor.action.showReferences'] = function(command, ctx)
	local locations = command.arguments[3]
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	if locations and #locations > 0 then
		local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
		vim.fn.setloclist(0, {}, ' ', { title = 'References', items = items, context = ctx })
		vim.api.nvim_command('lopen')
	end
end

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
