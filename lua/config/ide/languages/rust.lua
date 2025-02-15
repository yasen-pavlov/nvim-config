local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_base_path = extension_path .. 'lldb/lib/'
local liblldb_path = liblldb_base_path .. 'liblldb.so'
local cfg = require('rustaceanvim.config')
local mappings = require('user.keymaps').languages.rust

-- set correct liblldb for MacOS
if vim.fn.filereadable(liblldb_base_path .. 'liblldb.dylib') == 1 then
	liblldb_path = liblldb_base_path .. 'liblldb.dylib'
end

vim.g.rustaceanvim = {
	server = {
		on_attach = function(_, bufnr)
			local wk = require('which-key')

			wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))
		end,
	},
	dap = {
		autoload_configurations = true,
		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	},
}
