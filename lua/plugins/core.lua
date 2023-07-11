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
    config = function()
      require('config.cmp')
    end,
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
    config = function()
      require('config.lsp')
    end
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
    config = function()
      require('config.treesitter')
    end,
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

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    },
    config = function()
      require('config.telescope')
    end,
    cmd = "Telescope",
  },

  -- Which key
  {
    'folke/which-key.nvim',
    config = function()
      require('config.which-key')
    end,
    event = 'VeryLazy',
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
    end,
    keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
    event = 'User FileOpened',
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
        untracked    = { text = '︴' },
      },
    },
  },
}

