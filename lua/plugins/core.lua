return {
  -- cmp --
  'hrsh7th/nvim-cmp', -- The completion plugin
  'hrsh7th/cmp-buffer', -- buffer completions
  'hrsh7th/cmp-path', -- path completions
  'hrsh7th/cmp-cmdline',  -- cmdline completions
  'saadparwaiz1/cmp_luasnip', -- snippet completions
  'hrsh7th/cmp-nvim-lsp', -- lsp integration for cmp
  'hrsh7th/cmp-nvim-lua', -- nvim lua api completions

  -- cmp snippets
  'L3MON4D3/LuaSnip', --snippet engine
  'rafamadriz/friendly-snippets', -- a bunch of snippets to use

  -- lsp --
  'neovim/nvim-lspconfig', -- enable LSP
  'williamboman/mason.nvim', -- simple to use language server installer
  'williamboman/mason-lspconfig.nvim', -- simple to use language server installer
  'jose-elias-alvarez/null-ls.nvim', -- LSP diagnostics and code actions

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_insgtalled = { 'all' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  'HiPhish/rainbow-delimiters.nvim', -- colorize delimiter pairs

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = "󰉕 ", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<a-[>", -- binding to scroll down inside the popup
        scroll_up = "<a-]>", -- binding to scroll up inside the popup
      },
    }
  }
}

