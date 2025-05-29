local mappings = require('user.keymaps').lsp

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

-- setup LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufnr = event.buf
    local wk = require('which-key')
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    -- add mappings
    wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))

    -- autoformat on save
    require('lsp-format').on_attach(client, bufnr)

    -- enable inlay hints
    if not vim.lsp.inlay_hint.is_enabled() then
      vim.lsp.inlay_hint.enable(true)
    end
  end,
})

-- add borders to lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'
