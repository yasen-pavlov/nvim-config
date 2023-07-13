local load_config = function(plugin)
  return function()
    require('config.core.' .. plugin)
  end
end

return {

  -- cmp --
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-path', -- path completions
      'hrsh7th/cmp-cmdline',  -- cmdline completions
      'saadparwaiz1/cmp_luasnip', -- snippet completions
      'hrsh7th/cmp-nvim-lsp', -- lsp integration for cmp
      'hrsh7th/cmp-nvim-lua', -- nvim lua api completions
      'L3MON4D3/LuaSnip', --snippet engine
      'rafamadriz/friendly-snippets', -- a bunch of snippets to use
    },
    config = load_config('cmp'),
    event = { "InsertEnter", "CmdlineEnter" },
  },

  -- Mason, LSP & null-ls --
  {
    'williamboman/mason.nvim',
    dependencies = {
      'neovim/nvim-lspconfig', -- lsp configurations
      'williamboman/mason-lspconfig.nvim', -- mason lsp autoconfiguration
      'folke/neodev.nvim', -- nvim lua api configuration for lsp
      'b0o/schemastore.nvim', -- json and yaml schemastore
      'jose-elias-alvarez/null-ls.nvim', -- null-ls
      'jay-babu/mason-null-ls.nvim', -- mason null-ls configuration
    },
    config = load_config('mason'),
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason", "NullLs" },
  },

  -- Treesitter --
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim', -- colorize delimiter pairs
      'nvim-treesitter/playground',-- Treesitter playground
      'RRethy/nvim-treesitter-endwise', -- auto end structures like do, def, etc.
      'windwp/nvim-ts-autotag', -- auto close tags
      'JoosepAlviste/nvim-ts-context-commentstring', -- context aware comments
    },
    config = load_config('treesitter'),
    build = ':TSUpdate',
    event = "User FileOpened",
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
  },

  -- Telescope --
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- utility functions
      'nvim-telescope/telescope-file-browser.nvim' -- file browser for telescope
    },
    config = load_config('telescope'),
    cmd = "Telescope",
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
      { 'gb', mode = { 'n', 'v' } }
    },
  },

  -- gitsigns --
  {
    'lewis6991/gitsigns.nvim',
    config = load_config('gitsigns'),
    event = "User FileOpened",
    cmd = "Gitsigns",
  },
}

