--lsp configuration
vim.lsp.config('lua_ls', {
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable('lua_ls')

-- dap configuration
local dap = require('dap')

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
  },
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
end
