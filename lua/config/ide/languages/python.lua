-- lsp configuration

vim.lsp.config('pylsp', {
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})
vim.lsp.enable('pylsp')

-- dap configuration
require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')
