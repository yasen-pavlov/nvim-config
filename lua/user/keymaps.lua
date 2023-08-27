-- remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

local keymappings = {
	insert_mode = {
		{ keys = 'jk', command = '<ESC>', desc = 'Exit insert mode' },
		{ keys = '<A-j>', command = '<Esc>:m .+1<CR>==gi', desc = 'Move line down' },
		{ keys = '<A-k>', command = '<Esc>:m .-2<CR>==gi', desc = 'Move line up' },
	},
	normal_mode = {
		-- Move current line
		{ keys = '<A-j>', command = ':m .+1<CR>==', desc = 'Move line down' },
		{ keys = '<A-k>', command = ':m .-2<CR>==', desc = 'Move line up' },

		-- Resize current pane
		{ keys = '<A-Up>', command = ':resize -2<CR>', desc = 'Resize current pane up' },
		{ keys = '<A-Down>', command = ':resize +2<CR>', desc = 'Resize current pane down' },
		{ keys = '<A-Left>', command = ':vertical resize -2<CR>', desc = 'Resize current pane left' },
		{ keys = '<A-Right>', command = ':vertical resize +2<CR>', desc = 'Resize current pane right' },

		-- Telescope
		{ keys = '<C-f>', command = '<Cmd>Telescope live_grep theme=dropdown<CR>', desc = 'Find in files' },
		{ keys = '<C-s>', command = '<Cmd>Telescope find_files theme=dropdown<CR>', desc = 'Find files' },

		-- Buffers
		{ keys = '<A-,>', command = '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
		{ keys = '<A-.>', command = '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
		{ keys = '<A-<>', command = '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer left' },
		{ keys = '<A->>', command = '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer right' },
		{ keys = '<A-1>', command = '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1' },
		{ keys = '<A-2>', command = '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2' },
		{ keys = '<A-3>', command = '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3' },
		{ keys = '<A-4>', command = '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4' },
		{ keys = '<A-5>', command = '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to buffer 5' },
		{ keys = '<A-6>', command = '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to buffer 6' },
		{ keys = '<A-7>', command = '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to buffer 7' },
		{ keys = '<A-8>', command = '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to buffer 8' },
		{ keys = '<A-9>', command = '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to buffer 9' },
		{ keys = '<A-0>', command = '<Cmd>BufferLineGoToBuffer -1<CR>', desc = 'Go to last buffer' },
		{ keys = '<A-P>', command = '<Cmd>BufferLineTogglePin<CR>', desc = 'Pin buffer' },
		{ keys = '<A-c>', command = '<Cmd>Bdelete<CR>', desc = 'Close buffer' },

		-- dap
		{ keys = '<F5>', command = '<Cmd>lua require("dap").continue()<CR>', desc = 'Debugger start or continue' },
		{
			keys = '<F6>',
			command = '<Cmd>lua require("osv").launch({port = 8086})<CR>',
			desc = 'Launch lua DAP server',
		},
		{ keys = '<F7>', command = '<Cmd>lua require("dapui").toggle()<CR>', desc = 'Toggle debugger UI' },
		{ keys = '<F10>', command = '<Cmd>lua require("dap").step_over()<CR>', desc = 'Debugger step over' },
		{ keys = '<S-F10>', command = '<Cmd>lua require("dap").step_into()<CR>', desc = 'Debugger step into' },
		{ keys = '<F12>', command = '<Cmd>lua require("dap").step_out()<CR>', desc = 'Debugger step out' },
		{
			keys = '<C-b>',
			command = '<Cmd>lua require("dap").toggle_breakpoint()<CR>',
			desc = 'Debugger toggle breakpoint',
		},
		{ keys = '<A-d>', command = 'Vyp', desc = 'Duplicate line' },
	},
	visual_mode = {
		{ keys = '<A-j>', command = ":m '>+1<CR>gv=gv", desc = 'Move selected text down' },
		{ keys = '<A-k>', command = ":m '<-2<CR>gv=gv", desc = 'Move selected text up' },
		{ keys = 'J', command = '<gv', desc = 'Ident left' },
		{ keys = 'K', command = '>gv', desc = 'Ident right' },
		{ keys = 'p', command = 'p:let @+=@0<CR>', desc = 'restore register contents after put' },
	},
	term_mode = {
		{ keys = 'jk', command = '<C-\\><C-n>', desc = 'Exit insert mode' },
		{ keys = '<C-h>', command = '<Cmd>wincmd h<CR>', desc = 'Go to the left window' },
		{ keys = '<C-j>', command = '<Cmd>wincmd j<CR>', desc = 'Go to the down window' },
		{ keys = '<C-k>', command = '<Cmd>wincmd k<CR>', desc = 'Go to the up window' },
		{ keys = '<C-l>', command = '<Cmd>wincmd l<CR>', desc = 'Go to the right window' },
	},
}

local map = function(mode, keys, commmand, description)
	local opts_with_desc = vim.tbl_extend('error', { desc = description }, opts)

	vim.keymap.set(mode, keys, commmand, opts_with_desc)
end

local load_keymaps = function()
	for mode, mappings in pairs(keymappings) do
		for _, mapping in ipairs(mappings) do
			map(modes[mode], mapping['keys'], mapping['command'], mapping['desc'])
		end
	end
end

load_keymaps()
