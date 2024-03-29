local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
local cfg = require('rustaceanvim.config')
local mappings = require('user.keymaps').languages.rust

vim.g.rustaceanvim = {
	server = {
		on_attach = function(_, bufnr)
			local wk = require('which-key')
			local opts = { buffer = bufnr, remap = false }

			wk.register(mappings, opts)
		end,
	},
	dap = {
		autoload_configurations = true,
		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	},
}
