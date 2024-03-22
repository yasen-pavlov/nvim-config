local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
local mappings = require('user.keymaps').languages.rust

local rust_tools = require('rust-tools')
rust_tools.setup({
	server = {
		on_attach = function(_, bufnr)
			local wk = require('which-key')
			local opts = { buffer = bufnr, remap = false }

			wk.register(mappings, opts)
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
