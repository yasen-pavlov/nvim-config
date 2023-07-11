return {
  -- Colorscheme
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    opts = {
    },
    config = function()
      require('material').setup({

        styles = { -- Give comments style such as bold, italic, underline etc.
            comments = { italic = true },
            -- strings = { --[[ bold = true ]] },
            -- keywords = { --[[ underline = true ]] },
            -- functions = { --[[ bold = true, undercurl = true ]] },
            -- variables = {},
            -- operators = {},
            -- types = {},
        },
        plugins = { -- Uncomment the plugins that you use to highlight them
            -- Available plugins:
            -- 'dap',
            -- 'dashboard',
            'gitsigns',
            -- 'hop',
            'indent-blankline',
            -- 'lspsaga',
            -- 'mini',
            -- 'neogit',
            -- 'neorg',
            'nvim-cmp',
            -- 'nvim-navic',
            'nvim-tree',
            'nvim-web-devicons',
            -- 'sneak',
            'telescope',
            -- 'trouble',
            'which-key',
        },
        disable = {
            colored_cursor = false, -- Disable the colored cursor
            borders = false, -- Disable borders between verticaly split windows
            background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
            term_colors = false, -- Prevent the theme from setting terminal colors
            eob_lines = true -- Hide the end-of-buffer lines
        },
        high_visibility = {
            lighter = false, -- Enable higher contrast text for lighter style
            darker = false -- Enable higher contrast text for darker style
        },
        lualine_style = 'stealth',
      })
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
          theme = 'auto',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = ''},
        }
      }
    end
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      diagnostics = {
        enable = true,
      },
      renderer = {
        highlight_git = false,
        full_name = false,
        root_folder_label = ':t',
      },
    },
  },

  -- tabs
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          close_command = 'Bdelete! %d',
          right_mouse_command = 'Bdelete! %d',
          diagnostics = 'nvim_lsp',
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Explorer',
              padding = 1,
            },
          },
        }
      })
    end,
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

  -- indent lines
  'lukas-reineke/indent-blankline.nvim',

}

