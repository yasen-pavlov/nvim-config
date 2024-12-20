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
			'JoosepAlviste/nvim-ts-context-commentstring', -- context aware comments
			'nvim-treesitter/nvim-treesitter-textobjects', -- treesitter textobjects
			'nvim-treesitter/nvim-treesitter-context',
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

	-- ts autotag --
	{
		'windwp/nvim-ts-autotag',
		opts = {},
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- fzf-lua
	{
		'ibhagwan/fzf-lua',
		config = load_config('fzf-lua'),
		cmd = 'FzfLua',
	},

	-- Which key --
	{
		'folke/which-key.nvim',
		dependencies = {
			{ 'echasnovski/mini.icons', version = false },
		},
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
				keymap = {
					accept = '<M-;>',
				},
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
