local mappings = require('user.keymaps').languages.go

require('go').setup({
  lsp_cfg = true,
  lsp_gofumpt = true,
  lsp_on_attach = function(_, bufnr)
    local wk = require('which-key')

    wk.add(vim.list_extend(mappings, { { buffer = bufnr } }))
  end,
  trouble = true,
  luasnip = true,
})

local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})
