local load_config = function(plugin)
	return function()
		require('config.ide.' .. plugin)
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
			'onsails/lspkind.nvim',
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'petertriho/cmp-git',
			'nvim-lua/plenary.nvim',
		},
		config = load_config('cmp'),
		event = { 'InsertEnter', 'CmdlineEnter' },
	},

	-- lsp --
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'folke/neodev.nvim',
			'b0o/schemastore.nvim',
			'nvim-lua/plenary.nvim',
		},
		config = load_config('lsp'),
		event = { 'BufReadPre', 'BufNewFile' },
		cmd = { 'LspStart', 'LspInfo', 'LspInstall', 'LspUninstall' },
	},

	-- nvim-lightbulb --
	{
		'kosayoda/nvim-lightbulb',
		config = load_config('lightbulb'),
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- lsp-lightbulb --
	{
		'lvimuser/lsp-inlayhints.nvim',
		config = load_config('inlayhints'),
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- mason --
	{
		'williamboman/mason.nvim',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
		build = function()
			pcall(function()
				require('mason-registry').refresh()
			end)
		end,
		config = load_config('mason'),
		cmd = { 'Mason', 'MasonUpdate' },
	},

	-- null-ls --
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = {
			'jay-babu/mason-null-ls.nvim',
		},
		config = load_config('null-ls'),
		event = { 'BufReadPre', 'BufNewFile' },
		cmd = { 'NullLsInfo', 'NullLsAttach', 'NullsInstall', 'NullsUninstall' },
	},

	-- dap --
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			'jbyuki/one-small-step-for-vimkind',
			'mfussenegger/nvim-dap-python',
		},
		config = load_config('dap'),
		event = { 'BufReadPre', 'BufNewFile' },
	},

	-- rust-tools --
	{
		'simrat39/rust-tools.nvim',
		config = load_config('languages/rust'),
		ft = {
			'rust',
		},
	},

	-- typescript-tools --
	{
		'pmizio/typescript-tools.nvim',
		dependencies = {
			'mxsdev/nvim-dap-vscode-js',
			{
				'microsoft/vscode-js-debug',
				build = 'npm ci --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
			},
		},
		config = load_config('languages/typescript'),
		ft = {
			'javascript',
			'javascriptreact',
			'javascript.jsx',
			'typescript',
			'typescriptreact',
			'typescript.tsx',
		},
	},
}
