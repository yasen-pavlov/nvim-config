local opts = { noremap = false, silent = true }

local modes = {
	insert_mode = 'i',
	normal_mode = 'n',
	term_mode = 't',
	visual_mode = 'v',
	visual_block_mode = 'x',
	command_mode = 'c',
	operator_pending_mode = 'o',
}

local map = function(mode, keys, commmand, description)
	local opts_with_desc = vim.tbl_extend('error', { desc = description }, opts)

	vim.keymap.set(mode, keys, commmand, opts_with_desc)
end

local general_keymaps = require('user.keymaps').general

local load_keymaps = function()
	for mode, mappings in pairs(general_keymaps) do
		for _, mapping in ipairs(mappings) do
			map(modes[mode], mapping['keys'], mapping['command'], mapping['desc'])
		end
	end
end

load_keymaps()
