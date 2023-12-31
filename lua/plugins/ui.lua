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

	-- tabline
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'famiu/bufdelete.nvim',
		},
		config = load_config('bufferline'),
		event = 'User FileOpened',
	},

	-- fancy notifications
	{
		'rcarriga/nvim-notify',
		config = load_config('notify'),
		event = 'VimEnter',
	},

	-- indent lines
	{
		'lukas-reineke/indent-blankline.nvim',
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
}
