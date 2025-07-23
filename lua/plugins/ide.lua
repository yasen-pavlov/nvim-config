local load_config = function(plugin)
  return function()
    require('config.ide.' .. plugin)
  end
end

return {
  -- lazydev
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- blink --
  {
    'Saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'xzbdmw/colorful-menu.nvim',
      'onsails/lspkind.nvim',
    },
    config = load_config('blink'),
    event = { 'InsertEnter', 'CmdLineEnter' },
  },

  -- lsp --
  {
    'neovim/nvim-lspconfig',
    dependencies = {
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
      'fredrikaverpil/neotest-golang',
    },
    config = load_config('dap'),
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- rust --
  {
    'mrcjkb/rustaceanvim',
    config = load_config('languages/rust'),
    ft = { 'rust' },
  },

  -- vtsls --
  {
    'yioneko/nvim-vtsls',
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
    opts = {},
    cmd = { 'Trouble' },
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

  -- testing --
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-neotest/neotest-python',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'fredrikaverpil/neotest-golang',
    },
    config = load_config('neotest'),
    ft = {
      'go',
      'python',
      'rust',
    },
  },

  -- tailwind tools --
  {
    'luckasRanarison/tailwind-tools.nvim',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {},
    ft = {
      'html',
      'css',
      'vue',
      'astro',
      'svelte',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
  },

  -- autoformat --
  {
    'lukas-reineke/lsp-format.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- refactor --
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
