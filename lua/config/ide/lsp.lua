local mappings = require('user.keymaps').lsp
local lsp_zero = require('lsp-zero')

local ufo_capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

local lsp_capabilities = vim.tbl_deep_extend('force', require('blink.cmp').get_lsp_capabilities(), ufo_capabilities)
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, lsp_capabilities)

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

lsp_zero.on_attach(function(client, bufnr)
  -- configure mappings
  local wk = require('which-key')

  wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))

  -- autoformat on save
  lsp_zero.buffer_autoformat()

  -- enable inlay hints
  vim.lsp.inlay_hint.enable(true)
end)

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'
