local load_config = function(plugin)
	return function()
		require('config.ide.' .. plugin)
	end
end

return {
	-- lsp-zero --
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},

	-- cmp --
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'onsails/lspkind.nvim',
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'petertriho/cmp-git',
			'nvim-lua/plenary.nvim',
		},
		config = load_config('cmp'),
		build = 'make install_jsregexp',
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
			'SmiteshP/nvim-navic',
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

	-- lsp-inlayhints --
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
		'nvimtools/none-ls.nvim',
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
			'nvim-neotest/nvim-nio',
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

	-- trouble --
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
		cmd = { 'TroubleToggle' },
		event = { 'InsertEnter', 'CmdlineEnter' },
	},

	-- clangd extensions --
	{
		'p00f/clangd_extensions.nvim',
		config = load_config('languages/c'),
		ft = {
			'c',
			'cpp',
			'objc',
			'objcpp',
			'opencl',
			'arduino',
		},
	},

	-- go.nvim --
	{
		'ray-x/go.nvim',
		dependencies = {
			'ray-x/guihua.lua',
		},
		config = load_config('languages/go'),
		event = { 'CmdlineEnter' },
		ft = { 'go', 'gomod' },
		build = ':lua require("go.install").update_all_sync()',
	},

	-- glow.nvim --
	{ 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },

	-- surround.nvim --
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = true,
	},

	-- code folding --
	{
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
		config = load_config('ufo'),
		event = 'VeryLazy',
	},
}
