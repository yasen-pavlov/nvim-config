local load_config = function(plugin)
  return function()
    require('config.ui.' .. plugin)
  end
end

return {

  -- Material color scheme
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    config = load_config('material'),
    priority = 1000,
    event = 'VimEnter',
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = load_config('lualine'),
    event = 'VimEnter',
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = load_config('nvim-tree'),
    event = 'User DirOpened',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFocus',
      'NvimTreeFindFileToggle',
    },
  },

  -- nvim lsp file operations
  {

    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-tree.lua',
    },
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- illuminate
  {
    'RRethy/vim-illuminate',
    config = load_config('illuminate'),
    event = 'User FileOpened',
  },

  -- fancy notifications
  {
    'rcarriga/nvim-notify',
    config = load_config('notify'),
    event = 'VimEnter',
  },

  -- lsp progress
  {
    'j-hui/fidget.nvim',
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- indent lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    event = 'User FileOpened',
  },

  -- nvim-highlight-colors
  {
    'brenoprata10/nvim-highlight-colors',
    config = load_config('highlight-colors'),
    event = 'User FileOpened',
  },

  -- dressing
  {
    'stevearc/dressing.nvim',
    opts = {},
    event = 'VimEnter',
  },

  -- colortils
  {
    'yasen-pavlov/colortils.nvim',
    opts = {},
    cmd = { 'Colortils' },
  },

  -- winbar
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    config = load_config('dropbar'),
    event = { 'BufReadPre', 'BufNewFile' },
  },

  -- eyeliner
  {
    'jinh0/eyeliner.nvim',
    config = load_config('eyeliner'),
    event = 'VimEnter',
  },

  -- status column
  {
    'luukvbaal/statuscol.nvim',
    config = load_config('statuscol'),
    event = 'VimEnter',
  },

  -- toggle
  {
    [1] = 'gregorias/toggle.nvim',
    config = true,
    event = { 'VeryLazy' },
  },

  -- markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    ft = { 'markdown' },
  },
}
