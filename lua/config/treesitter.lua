local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  auto_install = true,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  endwise = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
})

