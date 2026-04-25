vim.lsp.enable('pylsp')

-- dap configuration
require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')
