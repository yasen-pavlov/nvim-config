local general = {
	insert_mode = {
		{ keys = 'jk', command = '<ESC>', desc = 'Exit insert mode' },
		{ keys = '<D-j>', command = '<Esc>:m .+1<CR>==gi', desc = 'Move line down' },
		{ keys = '<D-k>', command = '<Esc>:m .-2<CR>==gi', desc = 'Move line up' },
	},
	normal_mode = {
		-- Move current line
		{ keys = '<D-j>', command = ':m .+1<CR>==', desc = 'Move line down' },
		{ keys = '<D-k>', command = ':m .-2<CR>==', desc = 'Move line up' },

		-- Resize current pane
		{ keys = '<A-Up>', command = ':resize -2<CR>', desc = 'Resize current pane up' },
		{ keys = '<A-Down>', command = ':resize +2<CR>', desc = 'Resize current pane down' },
		{ keys = '<A-Left>', command = ':vertical resize -2<CR>', desc = 'Resize current pane left' },
		{ keys = '<A-Right>', command = ':vertical resize +2<CR>', desc = 'Resize current pane right' },

		-- Fzf
		{ keys = '<C-f>', command = '<Cmd>FzfLua live_grep<CR>', desc = 'Find in files' },
		{ keys = '<C-s>', command = '<Cmd>FzfLua files<CR>', desc = 'Find files' },

		-- Buffers
		{ keys = '<D-,>', command = '<Cmd>bprev<CR>', desc = 'Previous buffer' },
		{ keys = '<D-.>', command = '<Cmd>bnext<CR>', desc = 'Next buffer' },
		{ keys = '<A-c>', command = '<Cmd>bdelete<CR>', desc = 'Close buffer' },

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

local which_key = {
	{ '<leader><leader>', '<Cmd>noh<CR>', desc = 'Clear search', nowait = true, remap = false },
	{ '<leader>C', '<Cmd>Colortils<CR>', desc = 'Color picker', nowait = true, remap = false },
	{ '<leader>T', '<Cmd>lua _BTOP_TOGGLE()<CR>', desc = 'Resouce monitor', nowait = true, remap = false },
	{ '<leader>e', '<Cmd>NvimTreeToggle<CR>', desc = 'Explore', nowait = true, remap = false },
	{
		'<leader>f',
		'<Cmd>lua vim.opt.foldcolumn = vim.opt.foldcolumn:get() == "0" and "1" or "0"<CR>',
		desc = 'Toggle folding column',
		nowait = true,
		remap = false,
	},
	{ '<leader>g', group = 'Git', nowait = true, remap = false },
	{
		'<leader>gC',
		'<Cmd>lua Snacks.lazygit.log_file(opts)<CR>',
		desc = 'Show reflog for current file',
		nowait = true,
		remap = false,
	},
	{
		'<leader>gR',
		'<Cmd>lua require("gitsigns").reset_buffer()<CR>',
		desc = 'Reset Buffer',
		nowait = true,
		remap = false,
	},
	{ '<leader>gV', '<Cmd>DiffviewClose<CR>', desc = 'Close diffview', nowait = true, remap = false },
	{ '<leader>gl', '<Cmd>lua Snacks.git.blame_line()<CR>', desc = 'Blame current line', nowait = true, remap = false },
	{ '<leader>gb', '<Cmd>FzfLua git_branches<CR>', desc = 'Show branches', nowait = true, remap = false },
	{ '<leader>gc', '<Cmd>lua Snacks.lazygit.log()<CR>', desc = 'Show reflog', nowait = true, remap = false },
	{ '<leader>gd', '<Cmd>Gitsigns diffthis HEAD<CR>', desc = 'Git diff', nowait = true, remap = false },
	{ '<leader>gg', '<Cmd>lua Snacks.lazygit()<CR>', desc = 'Open lazygit', nowait = true, remap = false },
	{
		'<leader>gj',
		'<Cmd>lua require("gitsigns").next_hunk({navigation_message = false})<CR>',
		desc = 'Next Hunk',
		nowait = true,
		remap = false,
	},
	{
		'<leader>gk',
		'<Cmd>lua require("gitsigns").prev_hunk({navigation_message = false})<CR>',
		desc = 'Prev Hunk',
		nowait = true,
		remap = false,
	},
	{ '<leader>go', '<Cmd>FzfLua git_status<CR>', desc = 'Open changed file', nowait = true, remap = false },
	{
		'<leader>gp',
		'<Cmd>lua require("gitsigns").preview_hunk()<CR>',
		desc = 'Preview Hunk',
		nowait = true,
		remap = false,
	},
	{
		'<leader>gr',
		'<Cmd>lua require("gitsigns").reset_hunk()<CR>',
		desc = 'Reset Hunk',
		nowait = true,
		remap = false,
	},
	{
		'<leader>gs',
		'<Cmd>lua require("gitsigns").stage_hunk()<CR>',
		desc = 'Stage Hunk',
		nowait = true,
		remap = false,
	},
	{
		'<leader>gu',
		'<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>',
		desc = 'Undo Stage Hunk',
		nowait = true,
		remap = false,
	},
	{ '<leader>gv', '<Cmd>DiffviewOpen<CR>', desc = 'Open diffview', nowait = true, remap = false },
	{ '<leader>gy', desc = 'Copy git link', nowait = true, remap = false },
	{ '<leader>h', '<Cmd>WhichKey<CR>', desc = 'Key bindings help', nowait = true, remap = false },
	{ '<leader>l', group = 'LSP', nowait = true, remap = false },
	{ '<leader>li', '<Cmd>LspInfo<CR>', desc = 'Show LSP Info', nowait = true, remap = false },
	{ '<leader>lm', '<Cmd>Mason<CR>', desc = 'Mason', nowait = true, remap = false },
	{ '<leader>ln', '<Cmd>NullLsInfo<CR>', desc = 'Show null-ls info', nowait = true, remap = false },
	{ '<leader>p', group = 'Plugins', nowait = true, remap = false },
	{ '<leader>pL', '<Cmd>Lazy log<CR>', desc = 'Log', nowait = true, remap = false },
	{ '<leader>pS', '<Cmd>Lazy clear<CR>', desc = 'Status', nowait = true, remap = false },
	{ '<leader>pc', '<Cmd>Lazy clean<CR>', desc = 'Clean', nowait = true, remap = false },
	{ '<leader>pd', '<Cmd>Lazy debug<CR>', desc = 'Debug', nowait = true, remap = false },
	{ '<leader>pi', '<Cmd>Lazy install<CR>', desc = 'Install', nowait = true, remap = false },
	{ '<leader>pp', '<Cmd>Lazy profile<CR>', desc = 'Profile', nowait = true, remap = false },
	{ '<leader>ps', '<Cmd>Lazy sync<CR>', desc = 'Sync', nowait = true, remap = false },
	{ '<leader>pu', '<Cmd>Lazy update<CR>', desc = 'Update', nowait = true, remap = false },
	{ '<leader>q', '<Cmd>q!<CR>', desc = 'Quit', nowait = true, remap = false },
	{ '<leader>s', group = 'Search', nowait = true, remap = false },
	{ '<leader>sC', '<Cmd>FzfLua commands<CR>', desc = 'Find commands', nowait = true, remap = false },
	{ '<leader>sR', '<Cmd>FzfLua registers<CR>', desc = 'Find in registers', nowait = true, remap = false },
	{ '<leader>sT', '<Cmd>FzfLua<CR>', desc = 'Open FzfLua', nowait = true, remap = false },
	{ '<leader>sb', '<Cmd>FzfLua buffers<CR>', desc = 'Find in buffers', nowait = true, remap = false },
	{ '<leader>sc', '<Cmd>FzfLua colorschemes<CR>', desc = 'Find colorschemes', nowait = true, remap = false },
	{ '<leader>sf', '<Cmd>FzfLua files<CR>', desc = 'Find files', nowait = true, remap = false },
	{ '<leader>sg', '<Cmd>FzfLua live_grep<CR>', desc = 'Find in files', nowait = true, remap = false },
	{ '<leader>sh', '<Cmd>FzfLua helptags<CR>', desc = 'Find in help', nowait = true, remap = false },
	{ '<leader>sl', '<Cmd>FzfLua resume<CR>', desc = 'Resume last search', nowait = true, remap = false },
	{ '<leader>sm', '<Cmd>FzfLua manpages<CR>', desc = 'Find in man pages', nowait = true, remap = false },
	{ '<leader>sr', '<Cmd>FzfLua oldfiles<CR>', desc = 'Find recent files', nowait = true, remap = false },
	{ '<leader>u', '<Cmd>UndotreeToggle<CR>', desc = 'Undo history', nowait = true, remap = false },
	{ '<leader>w', '<Cmd>w!<CR>', desc = 'Save', nowait = true, remap = false },
	{ '<leader>x', group = 'Trouble', nowait = true, remap = false },
	{
		'<leader>xX',
		'<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
		desc = 'Show buffer diagnostics',
		nowait = true,
		remap = false,
	},
	{ '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', desc = 'Show location list', nowait = true, remap = false },
	{ '<leader>xq', '<Cmd>Trouble qflist toggle<CR>', desc = 'Show quickfix list', nowait = true, remap = false },
	{ '<leader>xx', '<Cmd>Trouble diagnostics toggle<CR>', desc = 'Show diagnostics', nowait = true, remap = false },
	{ '<leader>z', '<Cmd>set spell!<CR>', desc = 'Toggle spell checker', nowait = true, remap = false },
}

local lsp = {
	{ '<C-a>', '<Cmd>lua vim.lsp.buf.code_action()<CR>', desc = 'Select code action', remap = false },
	{
		'<leader>lS',
		'<Cmd>FzfLua lsp_workspace_symbols<CR>',
		desc = 'Show workspace symbols',
		remap = false,
	},
	{
		'<leader>lf',
		'<Cmd>lua vim.lsp.buf.format({async = true})<CR>',
		desc = 'Format buffer',
		remap = false,
	},
	{
		'<leader>lh',
		'<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>',
		desc = 'Toggle inlay hints',
		remap = false,
	},
	{
		'<leader>ll',
		'<Cmd>Trouble lsp toggle focus=false win.position=right<CR>',
		desc = 'Show definions / references / ...',
		remap = false,
	},
	{ '<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', desc = 'Rename all references', remap = false },
	{
		'<leader>ls',
		'<Cmd>Trouble symbols toggle focus=false<CR>',
		desc = 'Show workspace symbols',
		remap = false,
	},
	{ 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', desc = 'Show hover info', remap = false },
	{ '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', desc = 'Previous diagnostic', remap = false },
	{ ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', desc = 'Next diagnostic', remap = false },
	{ 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', desc = 'Go to declaration', remap = false },
	{ 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', desc = 'Go to definition', remap = false },
	{ 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', desc = 'Go to implementation', remap = false },
	{ 'gl', '<Cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Show diagnostic', remap = false },
	{ 'gr', '<Cmd>FzfLua lsp_references<CR>', desc = 'Show references', remap = false },
}

local go = {
	{ '<leader>o', group = 'Go', remap = false },
	{ '<leader>oc', '<Cmd>GoCodeLenAct<CR>', desc = 'Codelens', remap = false },
	{ '<leader>od', '<Cmd>GoDebug<CR>', desc = 'Debug', remap = false },
	{ '<leader>or', '<Cmd>GoRun<CR>', desc = 'Run', remap = false },
}

local rust = {
	{ '<leader>r', group = 'Rust', remap = false },
	{ '<leader>ra', '<Cmd>RustLsp hover actions<CR>', desc = 'Hover actions', remap = false },
	{ '<leader>rc', '<Cmd>RustLsp openCargo<CR>', desc = 'Open cargo', remap = false },
	{ '<leader>rr', '<Cmd>RustLsp runnables<CR>', desc = 'Run', remap = false },
}

local typescript = {
	{ '<leader>t', group = 'Typescript', remap = false },
	{ '<leader>tA', '<Cmd>VtsExec source_actions<CR>', desc = 'Show source actions', remap = false },
	{
		'<leader>tR',
		'<Cmd>VtsExec remove_unused<CR>',
		desc = 'Remove all unused statements',
		remap = false,
	},
	{ '<leader>ta', '<Cmd>VtsExec fix_all<CR>', desc = 'Fix all fixable errors', remap = false },
	{
		'<leader>td',
		'<Cmd>VtsExec goto_source_definition<CR>',
		desc = 'Go to source definition',
		remap = false,
	},
	{ '<leader>tf', '<Cmd>VtsExec file_references<CR>', desc = 'Show file references', remap = false },
	{
		'<leader>ti',
		'<Cmd>VtsExec organize_imports<CR>',
		desc = 'Sort and organize imports',
		remap = false,
	},
	{ '<leader>tm', '<Cmd>VtsExec add_missing_imports<CR>', desc = 'Add missing imports', remap = false },
	{
		'<leader>tr',
		'<Cmd>VtsExec remove_unused_imports<CR>',
		desc = 'Remove unused imports',
		remap = false,
	},
	{ '<leader>ts', '<Cmd>VtsExec sort_imports<CR>', desc = 'Sort imports', remap = false },
	{ '<leader>tt', '<Cmd>VtsExec select_ts_version<CR>', desc = 'Select TS version', remap = false },
}

return {
	general = general,
	which_key = which_key,
	lsp = lsp,
	languages = {
		go = go,
		rust = rust,
		typescript = typescript,
	},
}
