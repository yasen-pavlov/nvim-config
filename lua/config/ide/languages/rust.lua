local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local rust_tools = require('rust-tools')
rust_tools.setup({
	server = {
		on_attach = function(_, bufnr)
			local wk = require('which-key')
			local opts = { buffer = bufnr, remap = false }

			wk.register({
				['<leader>r'] = {
					name = 'Rust',
					a = { '<Cmd>RustHoverActions<CR>', 'Hover actions' },
					r = { '<Cmd>RustRunnables<CR>', 'Run' },
					d = { '<Cmd>RustDebuggables<CR>', 'Debug' },
					c = { '<Cmd>RustOpenCargo<CR>', 'Open cargo' },
				},
			}, opts)
		end,
	},
	tools = {
		inlay_hints = {
			auto = false,
		},
	},
	dap = {
		adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})
