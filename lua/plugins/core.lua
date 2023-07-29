local load_config = function(plugin)
	return function()
		require('config.core.' .. plugin)
	end
end

return {

	-- lsp-zero --
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		lazy = true,
		config = load_config('lsp-zero'),
	},

	-- cmp --
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'onsails/lspkind.nvim', -- kind icons for cmp
			'L3MON4D3/LuaSnip', -- snippet engine
			'rafamadriz/friendly-snippets', -- a bunch of snippets to use
			'hrsh7th/cmp-buffer', -- buffer completions
			'hrsh7th/cmp-path', -- path completions
			'hrsh7th/cmp-cmdline', -- cmdline completions
			'petertriho/cmp-git', -- git source for cmp
			'nvim-lua/plenary.nvim', -- functions library
		},
		config = load_config('cmp'),
		event = { 'InsertEnter', 'CmdlineEnter' },
	},

	-- lsp --
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'williamboman/mason-lspconfig.nvim',
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(function()
						require('mason-registry').refresh()
					end)
				end,
			},
			'folke/neodev.nvim',
			'b0o/schemastore.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'jay-babu/mason-null-ls.nvim',
			'kosayoda/nvim-lightbulb',
			'simrat39/rust-tools.nvim',
			'pmizio/typescript-tools.nvim',
			'nvim-lua/plenary.nvim',
			'lvimuser/lsp-inlayhints.nvim',
		},
		config = load_config('lsp'),
		event = { 'bufreadpre', 'bufnewfile' },
		cmd = { 'LspStart', 'LspInfo', 'LspInstall', 'LspUninstall', 'Mason', 'NullLs', 'MasonUpdate' },
	},

	-- dap --
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			'mxsdev/nvim-dap-vscode-js',
			{
				'microsoft/vscode-js-debug',
				build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
			},
			'jbyuki/one-small-step-for-vimkind',
			'mfussenegger/nvim-dap-python',
		},
		config = load_config('dap'),
		event = { 'bufreadpre', 'bufnewfile' },
	},

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
			'nvim-telescope/telescope-ui-select.nvim', -- vim ui select with telescope
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
}
