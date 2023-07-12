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

