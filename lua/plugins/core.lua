local load_config = function(plugin)
	return function()
		require('config.core.' .. plugin)
	end
end

return {

	-- Treesitter --
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'HiPhish/rainbow-delimiters.nvim', -- colorize delimiter pairs
			'nvim-treesitter/playground', -- Treesitter playground
			'RRethy/nvim-treesitter-endwise', -- auto end structures like do, def, etc.
			'windwp/nvim-ts-autotag', -- auto close tags
			'JoosepAlviste/nvim-ts-context-commentstring', -- context aware comments
		},
		config = load_config('treesitter'),
		build = ':TSUpdate',
		event = 'User FileOpened',
		cmd = {
			'TSInstall',
			'TSUninstall',
			'TSUpdate',
			'TSUpdateSync',
			'TSInstallInfo',
			'TSInstallSync',
			'TSInstallFromGrammar',
		},
	},

	-- Telescope --
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim', -- utility functions
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'nvim-telescope/telescope-file-browser.nvim', -- file browser for telescope
		},
		config = load_config('telescope'),
		cmd = 'Telescope',
	},

	-- Which key --
	{
		'folke/which-key.nvim',
		config = load_config('which-key'),
		event = 'VeryLazy',
	},

	-- autopairs --
	{
		'windwp/nvim-autopairs',
		config = load_config('autopairs'),
		event = 'InsertEnter',
	},

	-- Comment --
	{
		'numToStr/Comment.nvim',
		config = load_config('comment'),
		event = 'User FileOpened',
		keys = {
			{ 'gc', mode = { 'n', 'v' } },
			{ 'gb', mode = { 'n', 'v' } },
		},
	},

	-- gitsigns --
	{
		'lewis6991/gitsigns.nvim',
		config = load_config('gitsigns'),
		event = 'User FileOpened',
		cmd = 'Gitsigns',
	},

	-- undotree
	{
		'mbbill/undotree',
		event = 'VimEnter',
	},

	-- toggleterm
	{
		'akinsho/toggleterm.nvim',
		config = load_config('toggleterm'),
		event = 'VimEnter',
	},

	-- copilot
	{
		'zbirenbaum/copilot.lua',
		opts = {
			suggestion = {
				auto_trigger = true,
			},
		},
		cmd = 'Copilot',
		event = 'InsertEnter',
	},

	-- diffview
	{
		'sindrets/diffview.nvim',
		cmd = { 'DiffviewOpen' },
	},

	-- tmux-navigator
	{
		'christoomey/vim-tmux-navigator',
		event = 'VimEnter',
	},

	-- gitlinker
	{
		'ruifm/gitlinker.nvim',
		opts = {},
		event = 'User FileOpened',
	},

	-- bigfile
	{
		'LunarVim/bigfile.nvim',
		config = load_config('bigfile'),
		event = { 'FileReadPre', 'BufReadPre', 'User FileOpened' },
	},
}
