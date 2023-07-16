-- setup mason integration
require('mason-nvim-dap').setup({
	handlers = {},
})

-- enable virtual text
require('nvim-dap-virtual-text').setup()

-- breakpoint signs
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

-- register dapui listeners
local dap, dapui = require('dap'), require('dapui')

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close()
end

require('dap-vscode-js').setup({
	debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
	adapters = { 'pwa-node', 'pwa-chrome' },
})

local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }

for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {
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
		{
			type = 'pwa-chrome',
			request = 'launch',
			name = 'Start Chrome with "localhost"',
			url = 'http://localhost:3000',
			webRoot = '${workspaceFolder}',
			userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
		},
	}
end

dap.configurations.lua = {
	{
		type = 'nlua',
		request = 'attach',
		name = 'Attach to running Neovim instance',
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
end
