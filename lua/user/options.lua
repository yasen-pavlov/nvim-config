-- misc settings
vim.opt.shortmess:append('cI') -- suppress `ins-completion-menu` messages
vim.cmd('set whichwrap+=<,>,[,],h,l') -- set which keys can wrap to next/previous line if at end/beginning of line ('[' and ']' are for insert mode)
vim.cmd('set iskeyword+=-') -- treat words with dashes in them as whole words

-- remove disable mouse entry from context menu
vim.cmd('aunmenu PopUp.How-to\\ disable\\ mouse')
vim.cmd('aunmenu PopUp.-1-')

-- neovide settings
if vim.g.neovide then
	vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
	vim.g.neovide_input_use_logo = 1
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_floating_shadow = false
	vim.opt.linespace = 0

	vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- ts context commentstring settings
vim.g.skip_ts_context_commentstring_module = true

-- remap leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- options
return {
	clipboard = 'unnamedplus', -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
	fileencoding = 'utf-8', -- the encoding written to a file
	ignorecase = true, -- ignore case in search patterns
	mouse = 'a', -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term GUI colors (most terminals support this)
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 250, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = false, -- highlight the current line
	number = true, -- set numbered lines (shows only current line when used with relative)
	relativenumber = true, -- set relative numbered lines
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- how many lines to keep on screen vertically when scrolling
	sidescrolloff = 8, -- how many lines to keep on screen horizontally when scrolling
	laststatus = 3, -- enable global statusline
	guifont = 'JetBrainsMono_Nerd_Font:h15', -- GUI font
	linespace = 0, -- set line spacing (works only for GUI apps)
	foldlevel = 99, -- set fold level (required by ufo)
	foldlevelstart = 99, -- set fold level start (required by ufo)
	foldenable = true, -- enable folding
	spell = true, -- enable spellcheck
	spelllang = 'en_us', -- set spellcheck language
}
