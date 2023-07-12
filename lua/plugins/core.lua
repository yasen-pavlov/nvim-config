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

  -- LSP --
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim', -- package manager for lsp
      'williamboman/mason-lspconfig.nvim', -- lsp integration with mason
      'jose-elias-alvarez/null-ls.nvim', -- add non-lsp sources to hook to lsp
    },
    config = load_config('lsp'),
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
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

