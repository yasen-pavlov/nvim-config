local load_config = function(plugin)
	return function()
		require('config.ui.' .. plugin)
	end
end

return {

	-- Material colorscheme 'herpderp'
	{
		'marko-cerovac/material.nvim',
		lazy = false,
		config = load_config('material'),
		priority = 1000,
		event = 'VimEnter',
	},

	-- lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = load_config('lualine'),
		event = 'VimEnter',
	},

	-- File explorer
	{
		'nvim-tree/nvim-tree.lua',
		config = load_config('nvim-tree'),
		event = 'User DirOpened',
		cmd = {
			'NvimTreeToggle',
			'NvimTreeOpen',
			'NvimTreeFocus',
			'NvimTreeFindFileToggle',
		},
	},

	-- illuminate
	{
		'RRethy/vim-illuminate',
		config = load_config('illuminate'),
		event = 'User FileOpened',
	},

	-- fancy notifications
	{
		'rcarriga/nvim-notify',
		config = load_config('notify'),
		event = 'VimEnter',
	},

	-- lsp progress
	{
		'j-hui/fidget.nvim',
		opts = {},
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- indent lines
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
		event = 'User FileOpened',
	},

	-- nvim-highlight-colors
	{
		'brenoprata10/nvim-highlight-colors',
		config = load_config('highlight-colors'),
		event = 'User FileOpened',
	},

	-- dressing
	{
		'stevearc/dressing.nvim',
		opts = {},
		event = 'VimEnter',
	},

	-- colortils
	{
		'yasen-pavlov/colortils.nvim',
		opts = {},
		cmd = { 'Colortils' },
	},

	-- winbar
	{
		'utilyre/barbecue.nvim',
		name = 'barbecue',
		version = '*',
		dependencies = {
			'SmiteshP/nvim-navic',
		},
		config = load_config('barbecue'),
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- eyeliner
	{
		'jinh0/eyeliner.nvim',
		config = load_config('eyeliner'),
		event = 'VimEnter',
	},

	-- status column
	{
		'luukvbaal/statuscol.nvim',
		config = load_config('statuscol'),
		branch = '0.10',
		event = 'VimEnter',
	},
}
