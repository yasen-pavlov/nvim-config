require('toggleterm').setup({
	open_mapping = [[<a-\>]],
	insert_mappings = true,
	terminal_mappings = true,
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = 'lazygit',
	direction = 'float',
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
	end,
})

local btop = Terminal:new({
	cmd = 'btop',
	direction = 'float',
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
	end,
})

function _BTOP_TOGGLE()
	btop:toggle()
end
