return {
  -- Colorscheme
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = 'darker'
      vim.cmd([[colorscheme material]])
    end
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'material-stealth',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = ''},
        }
      }
    end
  },

  -- barbar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    }
  },

  -- illuminate
  {
    'RRethy/vim-illuminate',
      config = function()
        require('illuminate').configure {
          providers = {
            'lsp',
            'treesitter',
          },
        }
      end
  },

  -- fancy notifications
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')

      notify.setup {
        background_colour = '#212121',
        timeout = 3000
      }

      vim.notify = notify
    end
  },
}

