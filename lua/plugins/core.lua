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
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('telescope').load_extension 'file_browser'
    end
  },

  -- Telescope file browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim', -- colorize delimiter pairs
      'nvim-treesitter/playground',-- Treesitter playground
      'RRethy/nvim-treesitter-endwise', -- auto end structures like do, def, etc.
      'windwp/nvim-ts-autotag', -- auto close tags
      'JoosepAlviste/nvim-ts-context-commentstring', -- context aware comments
    },
    build = ':TSUpdate',
    config = function ()
      local treesitter = require('nvim-treesitter.configs')

      treesitter.setup({
        ensure_insgtalled = { 'all' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        autotag = { enable = true },
        context_commentstring = { enable = true },
      })
    end
  },


  -- Which key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      icons = {
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '', -- symbol used between a key and it's label
        group = '󰉕 ', -- symbol prepended to a group
      },
      ignore_missing = true,
    },
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function ()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = { 'string', 'source' },
          javascript = { 'string', 'template_string' },
          java = false,
        },
        fast_wrap = {},
      })

      -- configure cmp integration
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  },

  -- comment
  {
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },

  -- gitsigns
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '󰐊' },
        topdelete    = { text = '󰐊' },
        changedelete = { text = '󰐊' },
        untracked    = { text = '┆' },
      },
    },
  },
}

