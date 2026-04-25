local load_config = function(plugin)
	return function()
		require('config.core.' .. plugin)
	end
end

return {

	-- Treesitter --
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		dependencies = {
			'HiPhish/rainbow-delimiters.nvim', -- colorize delimiter pairs
			'JoosepAlviste/nvim-ts-context-commentstring', -- context aware comments (JSX/TSX/etc.)
		},
		config = load_config('treesitter'),
		event = { 'BufReadPre', 'BufNewFile' },
		cmd = { 'TSInstall', 'TSUpdate', 'TSLog' },
	},

	-- treesitter-context (independent of nvim-treesitter branch)
	{
		'nvim-treesitter/nvim-treesitter-context',
		opts = {},
		event = 'User FileOpened',
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
		'echasnovski/mini.comment',
		version = false,
		config = load_config('comment'),
		event = 'User FileOpened',
		keys = {
			{ 'gc', mode = { 'n', 'v' } },
			{ 'gcc', mode = 'n' },
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

	-- snacks (loaded early so bigfile / quickfile / notifier register before BufReadPre)
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		config = load_config('snacks'),
	},

	-- claude-code
	{
		'greggh/claude-code.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = load_config('claude-code'),
		cmd = { 'ClaudeCode', 'ClaudeCodeContinue', 'ClaudeCodeResume', 'ClaudeCodeVerbose' },
	},
}
