local opts = {
	mode = 'n', -- normal mode
	prefix = '<leader>', -- set leader key
	buffer = nil, -- create global mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local which_key = require('which-key')
local mappings = require('user.keymaps').which_key

which_key.setup({
	icons = {
		breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
		separator = '󰁔', -- symbol used between a key and it's label
		group = '󰉕 ', -- symbol prepended to a group
	},
	window = {
		border = 'single', -- none, single, double, shadow
	},
	ignore_missing = true,
})

which_key.register(mappings, opts)
