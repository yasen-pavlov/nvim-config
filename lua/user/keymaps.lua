local general = {
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
		{
			keys = '<C-i>',
			command = '<Cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({sort_mru = true}))<CR>',
			desc = 'Find buffers',
		},

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
	w = { '<Cmd>w!<CR>', 'Save' },
	q = { '<Cmd>q!<CR>', 'Quit' },
	e = { '<Cmd>NvimTreeToggle<CR>', 'Explore' },
	h = { '<Cmd>WhichKey<CR>', 'Key bindings help' },
	B = { '<Cmd>Telescope file_browser path=%:p:h select_buffer=true theme=ivy<CR>', 'File Browser' },
	u = { '<Cmd>UndotreeToggle<CR>', 'Undo history' },
	T = { '<Cmd>lua _BTOP_TOGGLE()<CR>', 'Resouce monitor' },
	C = { '<Cmd>Colortils<CR>', 'Color picker' },
	R = { '<Cmd>TroubleToggle<CR>', 'Open trouble' },
	['<leader>'] = { '<Cmd>noh<CR>', 'Clear search' },
	s = {
		name = 'Search',
		f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
		g = { '<Cmd>Telescope live_grep<CR>', 'Find in files' },
		b = { '<Cmd>Telescope buffers<CR>', 'Find in buffers' },
		r = { '<Cmd>Telescope oldfiles<CR>', 'Find recent files' },
		h = { '<Cmd>Telescope help_tags<CR>', 'Find in help' },
		m = { '<Cmd>Telescope man_pages<CR>', 'Find in man pages' },
		C = { '<Cmd>Telescope commands<CR>', 'Find commands' },
		c = { '<Cmd>Telescope colorscheme<CR>', 'Find colorschemes' },
		R = { '<Cmd>Telescope registers<CR>', 'Find in registers' },
		l = { '<Cmd>Telescope resume<CR>', 'Resume last search' },
		T = { '<Cmd>Telescope<CR>', 'Open Telescope' },
	},
	p = {
		name = 'Plugins',
		i = { '<Cmd>Lazy install<CR>', 'Install' },
		s = { '<Cmd>Lazy sync<CR>', 'Sync' },
		S = { '<Cmd>Lazy clear<CR>', 'Status' },
		c = { '<Cmd>Lazy clean<CR>', 'Clean' },
		u = { '<Cmd>Lazy update<CR>', 'Update' },
		p = { '<Cmd>Lazy profile<CR>', 'Profile' },
		L = { '<Cmd>Lazy log<CR>', 'Log' },
		d = { '<Cmd>Lazy debug<CR>', 'Debug' },
	},
	g = {
		name = 'Git',
		g = { '<Cmd>lua _LAZY_GIT_TOGGLE()<CR>', 'Lazygit' },
		j = { '<Cmd>lua require("gitsigns").next_hunk({navigation_message = false})<CR>', 'Next Hunk' },
		k = { '<Cmd>lua require("gitsigns").prev_hunk({navigation_message = false})<CR>', 'Prev Hunk' },
		l = { '<Cmd>lua require("gitsigns").blame_line()<CR>', 'Blame' },
		p = { '<Cmd>lua require("gitsigns").preview_hunk()<CR>', 'Preview Hunk' },
		r = { '<Cmd>lua require("gitsigns").reset_hunk()<CR>', 'Reset Hunk' },
		R = { '<Cmd>lua require("gitsigns").reset_buffer()<CR>', 'Reset Buffer' },
		s = { '<Cmd>lua require("gitsigns").stage_hunk()<CR>', 'Stage Hunk' },
		u = { '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', 'Undo Stage Hunk' },
		o = { '<Cmd>Telescope git_status<CR>', 'Open changed file' },
		b = { '<Cmd>Telescope git_branches<CR>', 'Checkout branch' },
		c = { '<Cmd>Telescope git_commits<CR>', 'Checkout commit' },
		C = { '<Cmd>Telescope git_bcommits<CR>', 'Checkout commit(for current file)' },
		d = { '<Cmd>Gitsigns diffthis HEAD<CR>', 'Git Diff' },
		v = { '<Cmd>DiffviewOpen<CR>', 'Open diffview' },
		V = { '<Cmd>DiffviewClose<CR>', 'Close diffview' },
		y = { 'Copy git link' },
	},
	l = {
		name = 'LSP',
		m = { '<Cmd>Mason<CR>', 'Mason' },
		i = { '<Cmd>LspInfo<CR>', 'Show LSP Info' },
		n = { '<Cmd>NullLsInfo<CR>', 'Show null-ls info' },
	},
}

local lsp = {
	g = {
		D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
		d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
		i = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
		l = { '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostic' },
		r = { '<Cmd>Telescope lsp_references<CR>', 'Show references' },
	},
	K = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Show hover info' },
	['<C-a>'] = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Select code action' },
	['[d'] = { '<Cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous diagnostic' },
	[']d'] = { '<Cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic' },
	['<leader>l'] = {
		r = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename all references' },
		f = { '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', 'Format buffer' },
		s = { '<Cmd>Telescope lsp_workspace_symbols<CR>', 'Show workspace symbols' },
		h = { '<Cmd>lua require("lsp-inlayhints").toggle()<CR>', 'Toggle inlay hints' },
	},
}

local go = {
	['<leader>o'] = {
		name = 'Go',
		r = { '<Cmd>GoRun<CR>', 'Run' },
		d = { '<Cmd>GoDebug<CR>', 'Debug' },
		c = { '<Cmd>GoCodeLenAct<CR>', 'Codelens' },
	},
}

local rust = {
	['<leader>r'] = {
		name = 'Rust',
		a = { '<Cmd>RustHoverActions<CR>', 'Hover actions' },
		r = { '<Cmd>RustRunnables<CR>', 'Run' },
		d = { '<Cmd>RustDebuggables<CR>', 'Debug' },
		c = { '<Cmd>RustOpenCargo<CR>', 'Open cargo' },
	},
}

local typescript = {
	['<leader>t'] = {
		name = 'Typescript',
		i = { '<Cmd>TSToolsOrganizeImports<CR>', 'Sort and organize imports' },
		s = { '<Cmd>TSToolsSortImports<CR>', 'Sort imports' },
		r = { '<Cmd>TSToolsRemoveUnusedImports<CR>', 'Remove unused imports' },
		R = { '<Cmd>TSToolsRemoveUnused<CR>', 'Remove all unused statements' },
		m = { '<Cmd>TSToolsAddMissingImports<CR>', 'Add missing imports' },
		a = { '<Cmd>TSToolsFixAll<CR>', 'Fix all fixable errors' },
		g = { '<Cmd>TSToolsGoToSourceDefinition<CR>', 'Go to source definition' },
	},
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
